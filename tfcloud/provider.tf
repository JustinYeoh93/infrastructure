provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.token
  version  = "~> 0.26.0"
}