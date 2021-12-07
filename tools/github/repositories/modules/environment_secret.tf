resource "github_actions_environment_secret" "environment_secrets" {
  for_each        = { for v in local.environment_secrets : format("%s__%s", v.environment_name, v.secret_name) => v }
  repository      = github_repository.repository.name
  environment     = each.value.environment_name
  secret_name     = each.value.secret_name
  plaintext_value = each.value.encrypted ? null : each.value.secret_value
  encrypted_value = each.value.encrypted ? each.value.secret_value : null
}

