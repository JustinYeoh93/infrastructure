resource "tfe_workspace" "minecraft" {
  name                  = "minecraft"
  organization          = data.tfe_organization.justinyeoh.name
  tag_names             = ["tfmanaged"]
  allow_destroy_plan    = false
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  working_directory     = "aws/minecraft"
}

resource "tfe_workspace" "random-var" {
  name                  = var.random_var
  organization          = data.tfe_organization.justinyeoh.name
  tag_names             = ["tfmanaged"]
  allow_destroy_plan    = false
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  working_directory     = "aws/minecraft"
}

resource "tfe_workspace" "random-var-2" {
  name                  = test
  organization          = data.tfe_organization.justinyeoh.name
  description           = var.random_var
  tag_names             = ["tfmanaged"]
  allow_destroy_plan    = false
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  working_directory     = "aws/minecraft"
}