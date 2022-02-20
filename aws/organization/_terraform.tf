terraform {

  backend "s3" {
    bucket         = ""
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "terraform-state-lock"
  }

  required_providers {
    aws = "~> 4.0.0"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}