resource "github_branch_protection" "branch_protections" {
  for_each                      = { for v in var.branch_protections : v.id => v }
  repository_id                 = github_repository.repository.name
  pattern                       = each.value.pattern
  enforce_admins                = each.value.enforce_admins
  required_signed_commits       = each.value.required_signed_commits
  required_linear_history       = each.value.required_linear_history
  required_status_check         = each.value.required_status_check
  required_pull_request_reviews = each.value.required_pull_request_reviews
  allow_deletions               = each.value.allow_deletions
  allow_force_pushes            = each.value.allow_force_pushes
}