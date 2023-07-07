locals {
  common_tags = {
    Provisioner = "Terraform"
    Repository  = var.repository
    Service     = var.service
  }
}
