terraform {
    backend "s3" {
        bucket = "liuandliu-statefiles"
        key = "corp"
        region = "ap-northeast-1"
        dynamodb_endpoint = "dynamodb.ap-northeast-1.amazonaws.com"
        dynamodb_table = "tf-lock"
    }
}