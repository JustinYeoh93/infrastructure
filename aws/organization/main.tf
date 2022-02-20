resource "aws_organizations_account" "accounts" {
  for_each                   = var.org_accounts
  name                       = each.key
  email                      = each.value.email
  iam_user_access_to_billing = each.value.iam_user_access_to_billing
}