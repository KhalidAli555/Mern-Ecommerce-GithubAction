############################################
# EKS Cluster
############################################

module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.37"

  #################################################
  # Cluster Configuration
  #################################################

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  #################################################
  # API Endpoint
  #################################################

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  #################################################
  # Authentication
  #################################################

  authentication_mode = "API"

  enable_cluster_creator_admin_permissions = true

  #################################################
  # Control Plane Logs
  #################################################

  cluster_enabled_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  #################################################
  # Networking
  #################################################

  vpc_id = data.aws_vpc.default.id

subnet_ids = data.aws_subnets.eks.ids

control_plane_subnet_ids = data.aws_subnets.eks.ids

  #################################################
  # IRSA / OIDC
  #################################################

  enable_irsa = true

  #################################################
  # AWS Managed Add-ons
  #################################################

  cluster_addons = {

    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent = true
    }

    aws-ebs-csi-driver = {
      most_recent = true
    }

    eks-pod-identity-agent = {
      most_recent = true
    }
  }

  #################################################
  # Managed Node Group
  #################################################

  eks_managed_node_groups = {

    default = {

      name = "mern-node-group"

      ami_type = "AL2023_x86_64_STANDARD"

      instance_types = [
        var.instance_type
      ]

      capacity_type = "ON_DEMAND"

      min_size     = 2
      desired_size = 2
      max_size     = 3

      disk_size = 20

      update_config = {
        max_unavailable = 1
      }

      labels = {
        role = "general"
      }

      tags = {
        Name = "mern-node-group"
      }
    }
  }

  #################################################
  # Common Tags
  #################################################

  tags = local.common_tags
}