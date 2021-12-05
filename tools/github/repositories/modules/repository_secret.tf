resource "github_actions_secret" "repository_secrets" {
  for_each        = { for v in var.repository_secrets : v.name => v }
  repository      = github_repository.repository.name
  secret_name     = each.key
  plaintext_value = each.value.encrypted == false ? each.value.value : null
  encrypted_value = each.value.encrypted ? each.value.value : null
}
