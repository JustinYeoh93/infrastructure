resource "aws_s3_bucket" "b" {
  bucket_prefix = "my-prod-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = var.aws_secretsmanager_secret_version.s3_prod_secret
    Environment = "prod"
  }
}