
# <application_license_badge>
<!--- [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](./LICENSE) --->

# BC Gov Terraform Template

This repo provides a starting point for users who want to create valid Terraform modules stored in GitHub.  

## Third-Party Products/Libraries used and the licenses they are covered by
<!--- product/library and path to the LICENSE --->
<!--- Example: <library_name> - [![GitHub](<shield_icon_link>)](<path_to_library_LICENSE>) --->

## Project Status
- [x] Development
- [ ] Production/Maintenance

# Documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_team.team](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team) | resource |
| [tfe_team_access.team_access](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_access) | resource |
| [tfe_team_token.team_token](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_token) | resource |
| [tfe_variable.aws_access_key_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.aws_secret_access_key](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.aws_target_account_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.aws_target_env](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.extra_workspaces](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.workspaces](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_id"></a> [access\_key\_id](#input\_access\_key\_id) | An AWS access key id. | `string` | `null` | no |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | Terraform 'execution mode' - either 'remote' or 'local'.  See TFC docs for description of each. | `string` | `"remote"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The name of the Terraform Cloud / Enterprise organization in which the workspace and other resources should be created. | `string` | n/a | yes |
| <a name="input_project_accounts"></a> [project\_accounts](#input\_project\_accounts) | The set of AWS project accounts for which we want to create TFC workspaces. | `any` | `null` | no |
| <a name="input_project_definition_file_path"></a> [project\_definition\_file\_path](#input\_project\_definition\_file\_path) | Full path to JSON file containing project definition structure. (project.json by convention) | `string` | `"project.json"` | no |
| <a name="input_secret_access_key"></a> [secret\_access\_key](#input\_secret\_access\_key) | An AWS secret access key. | `string` | `null` | no |
| <a name="input_team_access_level"></a> [team\_access\_level](#input\_team\_access\_level) | The value indicating the level of access (permission set) that the TF Cloud team being created should have in the workspace being created. | `string` | `"plan"` | no |
| <a name="input_tfc_token"></a> [tfc\_token](#input\_tfc\_token) | Token with administrative access to Terraform cloud organization targeted by the module. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Getting Started
<!--- setup env vars, secrets, instructions... --->

## Getting Help or Reporting an Issue
<!--- Example below, modify accordingly --->
To report bugs/issues/feature requests, please file an [issue](../../issues).


## How to Contribute
<!--- Example below, modify accordingly --->
If you would like to contribute, please see our [CONTRIBUTING](./CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). 
By participating in this project you agree to abide by its terms.


## License
<!--- Example below, modify accordingly --->
    Copyright 2018 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
