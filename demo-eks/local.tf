locals {
  # 환경 설정
  project_name = "demo"
  environment = "test"
  region = "ap-northeast-2"
  
  # 태그 설정
  common_tags = {
    ENV = "TEST"
    Project     = local.project_name
    Terraform   = "true"
  }
  eks = {
    name = "demo-eks-auto-mode"
    access_entries = {
      terraform_devops = {
          principal_arn = data.terraform_remote_state.demo_etc.outputs.bastion_role_arn
          policy_associations = {
            single = {
              policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
              access_scope = {
                type = "cluster"
              }
            }
          }
        }
    }
    cluster_security_group_additional_rules= {
      bastion_to_cluster = {
        source_security_group_id = data.terraform_remote_state.demo_etc.outputs.bastion_sg_id
        description = "bastion_to_cluster"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        type        = "ingress"
      }
    }
  }
}