locals {
  # 환경 설정
  appname = "demo"
  environment = "test"
  region = "ap-northeast-2"
  
  # 태그 설정
  common_tags = {
    ENV = "TEST"
    Project     = "demo"
    Terraform   = "true"
  }

}