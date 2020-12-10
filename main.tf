terraform {
	required_providers {
		tfe = "~> 0.23.0"
	}
}

provider "tfe" {
	version = "~> 0.23.0"
	token = var.tfc_token
}

locals {
	project = jsondecode(file(var.project_definition_file_path))
}

resource "tfe_team" "team" {
	name         = "${local.project.name} Team"
	organization = var.organization
}

resource "tfe_workspace" "workspaces" {
	for_each = { for account in local.project.accounts : account.environment => account }

	name = "${local.project.identifier}-${lower(each.value.environment)}"
	organization = var.organization
	execution_mode =var.execution_mode

	lifecycle {
		ignore_changes = [
			# Ignore changes to name because teams may change workspace names.
			name,
		]
	}
}

resource "tfe_team_access" "team_access" {
	for_each = tfe_workspace.workspaces
	access       = var.team_access_level
	team_id      = tfe_team.team.id
	workspace_id = each.value.id
}

resource "tfe_team_token" "team_token" {
	team_id = tfe_team.team.id
}

//@todo handling of workspace variables should refactored so we don't need to have an input variable definition for each one, and so they are not semantically tied to AWS credentials, since we will have workspaces for a variety of purposes, many of which will have nothing to do with AWS.

resource "tfe_variable" "aws_secret_access_key" {
	for_each = (var.secret_access_key != null ? tfe_workspace.workspaces : {} )
	key          = "AWS_SECRET_ACCESS_KEY"
	value        = var.secret_access_key
	category     = "env"
	sensitive = true
	workspace_id = each.value.id
	description  = "AWS secret access key."
}

resource "tfe_variable" "aws_access_key_id" {
	for_each = (var.access_key_id != null ? tfe_workspace.workspaces : {} )
	key          = "AWS_ACCESS_KEY_ID"
	value        = var.access_key_id
	category     = "env"
	sensitive = true
	workspace_id = each.value.id
	description  = "AWS access key id."
}

resource "tfe_variable" "aws_target_account_id" {
	for_each = (var.project_accounts != null ? var.project_accounts : {} )
	category = "terraform"
	key = "target_aws_account_id"
	value = each.value.id
	workspace_id = tfe_workspace.workspaces[each.key].id
}

resource "tfe_variable" "aws_target_env" {
	for_each = (var.project_accounts != null ? var.project_accounts : {} )
	category = "terraform"
	key = "target_env"
	value = each.key
	workspace_id = tfe_workspace.workspaces[each.key].id
}

