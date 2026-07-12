locals {

  common_tags = {

    Project = "MERN"

    Environment = var.environment

    Terraform = "true"

    ManagedBy = "Terraform"

    Owner = "Khalid"
  }
}