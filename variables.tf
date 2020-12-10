
variable "project_definition_file_path" {
	default = "project.json"
	description = "Full path to JSON file containing project definition structure. (project.json by convention)"
	type = string
}

variable "organization" {
	type = string
	description = "The name of the Terraform Cloud / Enterprise organization in which the workspace and other resources should be created."
}

variable "tfc_token" {
	type = string
	description = "Token with administrative access to Terraform cloud organization targeted by the module."
}

variable "team_access_level" {
	type = string
	default = "plan"
	description = "The value indicating the level of access (permission set) that the TF Cloud team being created should have in the workspace being created."
}

variable "secret_access_key" {
	description = "An AWS secret access key."
	type = string
	default = null
}

variable "access_key_id" {
	description = "An AWS access key id."
	type = string
	default = null
}

variable "execution_mode" {
	description = "Terraform 'execution mode' - either 'remote' or 'local'.  See TFC docs for description of each."
	type = string
	default = "remote"
}

variable "project_accounts" {
	description = "The set of AWS project accounts for which we want to create TFC workspaces."
	type = any
	default = null
}

