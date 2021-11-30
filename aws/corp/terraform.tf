terraform {
  backend "s3" {
    bucket = "liuandliu-statefiles"
    key    = "corp"
    region = "ap-northeast-1"
    dynamo_table = "tf-lock"
  }
}