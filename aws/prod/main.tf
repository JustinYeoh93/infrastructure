resource "aws_s3_bucket" "b" {
  bucket_prefix = "my-prod-tf-test-bucket"
  acl           = "private"

  tags = {
    Environment = "prod"
  }
}