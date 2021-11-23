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

resource "tfe_workspace" "monitoring" {
  name                  = "monitoring"
  organization          = data.tfe_organization.justinyeoh.name
  tag_names             = ["tfmanaged"]
  allow_destroy_plan    = false
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  working_directory     = "aws/monitoring"
}