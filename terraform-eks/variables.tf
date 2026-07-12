variable "aws_region" {

  description = "AWS Region"

  type = string

  default = "us-east-1"
}

variable "cluster_name" {

  description = "EKS Cluster Name"

  type = string

  default = "mern-eks"
}

variable "cluster_version" {

  description = "Kubernetes Version"

  type = string

  default = "1.36"
}

variable "instance_type" {

  description = "EC2 Instance Type"

  type = string

  default = "t3.medium"
}

variable "environment" {

  description = "Deployment Environment"

  type = string

  default = "dev"
}