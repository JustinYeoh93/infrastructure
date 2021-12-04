variable "admins" {
  type        = list(string)
  default     = []
  description = "Admins of the organization"
}

variable "teams" {
  type = map(object({
    name           = string
    description    = optional(string)
    privacy        = string
    parent_team_id = optional(string)
    members        = list(string)
    maintainers    = optional(list(string))
  }))
  default     = {}
  description = "Organization team and its members"
}
