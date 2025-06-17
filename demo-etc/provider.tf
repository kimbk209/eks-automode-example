terraform {
  backend "s3" {
    profile = "byunggwon"
    bucket         = "byunggwon-demo-terraform-state"
    key            = "demo-etc/terraform.tfstate"
    region         = "ap-northeast-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = local.region
  profile = "byunggwon"

}