data "aws_ssm_parameter" "foo" {
  name = "/foo/bar"
}

output "data" {
  value = data.aws_ssm_parameter.foo
}