resource "github_repository_file" "codeowners" {
  count               = var.codeowners == "" ? 0 : 1
  repository          = github_repository.repository.name
  branch              = "develop"
  file                = ".github/CODEOWNERS"
  content             = var.codeowners
  commit_message      = "Managed by Terraform"
  overwrite_on_create = true

  # Ignoring because only need it for initialization
  lifecycle {
    ignore_changes = [
      content
    ]
  }
}
