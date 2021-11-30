terraform {
  backend "s3" {
    bucket = "liuandliu-statefiles"
    key    = "prod"
    region = "ap-northeast-1"
    dynamo_table = "tf-lock"
  }
}