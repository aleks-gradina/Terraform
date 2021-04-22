resource "aws_kms_key" "this" {
  description             = var.eks_kms_key_description
  deletion_window_in_days = 10
}

resource "aws_eks_cluster" "this" {
  name     = var.eks_cluster_name
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids              = flatten([var.private_subnets, var.public_subnets])
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
  }

  encryption_config {
    provider {
      key_arn = aws_kms_key.this.arn
    }

    resources = ["secrets"]
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.eks_node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnets
  disk_size       = var.eks_node_disk_size
  instance_types  = var.eks_node_instance_type

  labels = {
    "type" = "general"
  }

  scaling_config {
    desired_size = var.general_desired_size
    max_size     = var.general_max_size
    min_size     = var.general_min_size
  }

  tags = {
    Name = var.eks_node_group_name
  }
}