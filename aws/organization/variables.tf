variable "org_accounts" {
  type = map(object({
    email = string
  }))
  default     = {}
  description = "object mapping of organization accounts"
}
