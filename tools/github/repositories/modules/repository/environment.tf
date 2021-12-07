resource "github_repository_environment" "environments" {
  for_each    = { for v in var.environments : v.name => v }
  environment = each.key
  repository  = github_repository.repository.name
  deployment_branch_policy {
    protected_branches     = each.value.protected_branches_only
    custom_branch_policies = false
  }

  dynamic "reviewers" {
    for_each = (each.value.reviewers.teams == [] && each.value.reviewers.users == []) ? [] : [1]
    content {
      teams = each.value.reviewers.teams == [] ? null : data.team_name_team_id_db[each.value.reviewers.teams]
      users = each.value.reviewers.users == [] ? null : each.value.reviewers.users
    }
  }
}