data "aws_secretsmanager_secret" "justin_secret" {
  arn = "arn:aws:secretsmanager:ap-northeast-1:021498413756:secret:justin/secret-XyxJVU"
}

data "aws_secretsmanager_secret_version" "s3_prod_secret" {
  secret_id = data.aws_secretsmanager_secret.justin_secret.id
}

output "name" {
  value     = data.aws_secretsmanager_secret_version.s3_prod_secret.secret_string
  sensitive = true
}

output "id" {
    value = data.aws_secretsmanager_secret.justin_secret.id
}