terraform {
  backend "s3" {
    bucket         = "liuandliu-statefiles"
    key            = "prod"
    region         = "ap-northeast-1"
    dynamodb_table = "tf-lock"
  }
}