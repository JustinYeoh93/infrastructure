variable "members" {
  type = object({
    admins  = list(string)
    members = list(string)
  })
  default = {
    admins  = []
    members = []
  }
  description = "Members of the organization"
}

variable "teams" {
  type = map(object({
    name           = string
    description    = optional(string)
    privacy        = string
    members        = list(string)
    maintainers    = list(string)
  }))
  default     = {}
  description = "Organization team and its members. Privacy is either closed or secret."
}
