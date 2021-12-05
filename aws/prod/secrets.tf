data "aws_secretsmanager_secret" "justin_secret" {
  arn = "arn:aws:secretsmanager:ap-northeast-1:021498413756:secret:justin/secret-XyxJVU"
}

data "aws_secretsmanager_secret_version" "s3_prod_secret" {
  secret_id = data.aws_secretsmanager_secret.justin_secret.id
}

data "aws_ssm_parameter" "foo" {
  name = "/foo/bar"
}

output "ssm_parameter" {
  value = data.aws_ssm_parameter.foo.value
}

output "name" {
  value     = data.aws_secretsmanager_secret_version.s3_prod_secret.secret_string
}

output "id" {
    value = data.aws_secretsmanager_secret.justin_secret.id
}