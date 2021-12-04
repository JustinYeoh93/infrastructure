terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.13"
    }
  }
  experiments = [module_variable_optional_attrs] # to allow the use of optional flag
}

provider "github" {
  owner = "exwzd"
}