provider "aws" {
    assume_role {
        role_arn = "arn:aws:iam::021498413756:role/terraform-admin-role"
    }
}