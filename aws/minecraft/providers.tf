terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "justinyeoh"

    workspaces {
      name = "minecraft"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

