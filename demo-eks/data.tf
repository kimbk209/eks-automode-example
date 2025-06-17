# Remote state에서 VPC 및 기타 리소스 정보 가져오기
data "terraform_remote_state" "demo_etc" {
  backend = "s3"
  config = {
    profile        = "byunggwon"
    bucket         = "byunggwon-demo-terraform-state"
    key            = "demo-etc/terraform.tfstate"
    region         = "ap-northeast-2"
  }
}