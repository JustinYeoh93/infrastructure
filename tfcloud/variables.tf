variable "token" {
  type        = string
  default     = ""
  description = "Token used to authenticate to TF Cloud"
  sensitive   = true
}

variable "random_var" {
  type        = string
  default     = ""
  description = "Random token test rotation"
  sensitive   = true
}
