terraform {

  backend "remote" {
    organization = "justinyeoh"

    workspaces {
      name = "aws-org"
    }
  }
  required_providers {
    aws = "~> 4.0.0"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}