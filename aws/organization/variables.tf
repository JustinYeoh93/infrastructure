variable "org_accounts" {
  type = map(object({
    email                      = string
    iam_user_access_to_billing = string
  }))
  default     = {}
  description = "object mapping of organization accounts"
}
