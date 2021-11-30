resource "aws_s3_bucket" "test" {
  bucket = "liuandliu-bucket-for-testing"
  acl    = "private"

  tags = {
    Name        = "tet"
    Environment = "corp"
    Terraform = "managed"
  }
}