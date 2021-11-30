resource "aws_s3_bucket" "test" {
  bucket = "l&l-test-bucket"
  acl    = "private"

  tags = {
    Name        = "tet"
    Environment = "corp"
    Terraform = "managed"
  }
}