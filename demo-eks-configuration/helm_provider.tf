# Get EKS cluster data from remote state
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    profile        = "byunggwon"
    bucket         = "byunggwon-demo-terraform-state"
    key            = "demo/terraform.tfstate"
    region         = "ap-northeast-2"
  }
}

data "aws_eks_cluster_auth" "default" {
  name = data.terraform_remote_state.eks.outputs.cluster_name
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
    token = data.aws_eks_cluster_auth.default.token
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data)
  }
}
