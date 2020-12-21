# Description: Template creates sample AWS EKS managed kubernetes cluster.  Pre-configured vpc required.

provider "aws" {
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_eks_cluster" "terraform_cluster" {
    name = "terraform_cluster"
    role_arn = var.eks_role_arn

    vpc_config {
        subnet_ids = [var.subnet_1, var.subnet_2]
    }
}
    output "terraform_cluster_endpoint" {
        value = aws_eks_cluster.terraform_cluster.endpoint
    }

# Documentation: https://github.com/Asingjr2/exploring_terraform/blob/main/standalone/s3/s3.tf