terraform {
  backend "s3" {
    bucket         = "liuandliu-statefiles"
    key            = "github/repositories"
    region         = "ap-northeast-1"
    dynamodb_table = "tf-lock"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.13"
    }
  }
  experiments = [module_variable_optional_attrs] # to allow the use of optional flag
}

provider "github" {
  owner = "liuandliu"
}