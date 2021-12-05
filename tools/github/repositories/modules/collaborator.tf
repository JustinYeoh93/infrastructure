resource "github_repository_collaborator" "collaborators" {
  for_each   = { for v in var.collaborators : v.username => v }
  repository = github_repository.repository.name
  username   = each.value.username
  permission = each.value.permission
}
