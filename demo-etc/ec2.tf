resource "aws_instance" "bastion" {
  ami                  = "ami-0c593c3690c32e925" # Amazon Linux 2023
  instance_type        = "t3.small"
  subnet_id            = aws_subnet.pubsvr_a.id
  security_groups      = [aws_security_group.bastion_sg.id]
  iam_instance_profile = aws_iam_instance_profile.bastion_profile.name
  key_name             = "demo"
  
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  user_data = <<-EOF
    #!/bin/bash
    # 시스템 업데이트
    dnf update -y
    
    # AWS CLI 설치 (최신 버전)
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    dnf install -y unzip
    unzip awscliv2.zip
    ./aws/install
    
    # kubectl 설치
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    mv kubectl /usr/local/bin/
    
    # eksctl 설치
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    mv /tmp/eksctl /usr/local/bin
    
    # helm 설치
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    
    # kubeconfig 설정
    # aws eks update-kubeconfig --region ap-northeast-2 --name demo-eks-auto-mode
    
    # 필요한 도구 설치
    dnf install -y jq git
  EOF

  tags = merge(
    local.common_tags,
    {
      Name = "${local.project_name}-bastion"
    }
  )
}