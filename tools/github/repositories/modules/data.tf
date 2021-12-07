locals {
  environment_secrets = flatten([
    for environment in var.environments : [
      for secret in environment.secrets : {
        environment_name = environment.name
        secret_name      = secret.name
        encrypted        = secret.encrypted
        secret_value     = secret.value
      }
    ]

  ])
}