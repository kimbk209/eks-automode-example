locals {
  # 환경 설정
  project_name = "demo"
  environment = "test"
  region = "ap-northeast-2"
  
  
  
  # 태그 설정
  common_tags = {
    ENV = "TEST"
    Project     = "demo"
    Terraform   = "true"
  }
  
  # VPC 설정
  vpc = {
    name = "vpc-demo"
    cidr = "10.194.204.0/22"  # 테스트 환경 VPC CIDR
  }
  
  # 서브넷 설정
  subnets = {
    public_a = {
      name = "demo-pubsvr-a"
      cidr = "10.194.204.0/25"  # 테스트 환경 퍼블릭 서브넷 A CIDR
    }
    public_c = {
      name = "demo-pubsvr-c"
      cidr = "10.194.204.128/25"  # 테스트 환경 퍼블릭 서브넷 C CIDR
    }
    private_a = {
      name = "demo-prvsvr-a"
      cidr = "10.194.205.0/25"  # 테스트 환경 프라이빗 서브넷 A CIDR
    }
    private_c = {
      name = "demo-prvsvr-c"
      cidr = "10.194.205.128/25"  # 테스트 환경 프라이빗 서브넷 C CIDR
    }
    data_a = {
      name = "demo-data-a"
      cidr = "10.194.206.0/25"  # 테스트 환경 데이터 서브넷 A CIDR
    }
    data_c = {
      name = "demo-data-c"
      cidr = "10.194.206.128/25"  # 테스트 환경 데이터 서브넷 C CIDR
    }
  }
  
  # 라우팅 테이블 설정
  route_tables = {
    public = {
      name = "demo-public-rt"
    }
    private = {
      name = "demo-private-rt"
    }
  }
  
  ec2= {
    bastion = {
      name = "beautyapp-test-bastion"
      type = "t3.nano"
      volume_size = 20
      security_groups = ["bastion"]  # 배스천 보안 그룹 사용
    }
    # server_a = {
    #   name = "beautyapp-test-server-a"
    #   type = "m5.large"
    #   volume_size = 100
    #   security_groups = ["private"]  # 프라이빗 보안 그룹 사용
    # }
    # key_name = "beautyapp-test.pem"
  }
  # 보안 그룹 설정은 security_groups.tf 파일로 이동했습니다.
  
  # EC2 인스턴스 설정
  # ec2_instances = {
  #   bastion = {
  #     name = "beautyapp-test-bastion"
  #     type = "t3.nano"
  #     volume_size = 20
  #     security_groups = ["bastion"]  # 배스천 보안 그룹 사용
  #   }
  #   server_a = {
  #     name = "beautyapp-test-server-a"
  #     type = "m5.large"
  #     volume_size = 100
  #     security_groups = ["private"]  # 프라이빗 보안 그룹 사용
  #   }
  # }
  
  # S3 버킷 설정
  # s3_buckets = {
  #   test-beautyapp = {
  #     name = "test-beautyapp"
  #     description = "Beauty App 테스트계에서 사용하는 S3 버킷"
  #   }
  #   test-beautyapp-logs = {
  #     name = "test-beautyapp-logs"
  #     description = "Beauty App 테스트 환경 로그"
  #   }
  # }
  
  # # ACM 인증서 설정
  # acm = {
  #   domain_name = "test-beautyapp.example.com"
  #   subject_alternative_names = ["*.test-beautyapp.example.com"]
  #   create_route53_records = false
  #   route53_zone_id = ""
  #   wait_for_validation = true
  #   validation_record_fqdns = []
  # }
  
}
