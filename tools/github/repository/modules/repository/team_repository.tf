resource "github_team_repository" "team_repositories" {
  for_each   = { for v in var.teams : v.name => v }
  team_id    = local.team_name_team_id_db[each.key].id
  repository = github_repository.repository.name
  permission = each.value.permission
}

