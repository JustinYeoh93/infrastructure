data "aws_secretsmanager_secret" "justin_secret" {
  arn = "arn:aws:secretsmanager:ap-northeast-1:245185267610:secret:justin/secret-d7bO1O"
}

data "aws_secretsmanager_secret_version" "s3_prod_secret" {
  secret_id = data.aws_secretsmanager_secret.justin_secret.id
}

output "name" {
  value = data.aws_secretsmanager_secret_version.justin_secret.secret_string
}
