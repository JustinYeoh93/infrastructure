resource "tfe_workspace" "minecraft" {
    name = "minecraft"
    organization = data.tfe_organization.justinyeoh.name
    tag_names = ["terraform-managed"]
}