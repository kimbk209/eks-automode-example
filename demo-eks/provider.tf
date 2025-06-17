terraform {
  backend "s3" {
    profile = "byunggwon"
    bucket         = "byunggwon-demo-terraform-state"
    key            = "demo-eks-configuration/terraform.tfstate"
    region         = "ap-northeast-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = local.region
  profile = "byunggwon"

}

