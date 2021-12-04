terraform {
  backend "remote" {
    organization = "justinyeoh"

    workspaces {
      name = "terraform_cloud"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.26.0"
    }
  }
}