module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = local.eks.name
  cluster_version = "1.30" #버전 업그레이드 시연

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  # Bastion 호스트에서 접근할 수 있도록 설정
  access_entries = local.eks.access_entries

  cluster_security_group_additional_rules = local.eks.cluster_security_group_additional_rules

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  # Remote state에서 VPC 및 서브넷 정보 가져오기
  vpc_id     = data.terraform_remote_state.demo_etc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.demo_etc.outputs.private_subnet_ids

  tags = local.common_tags
}