resource "aws_vpc" "vpc_demo" {
  cidr_block           = local.vpc.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = local.vpc.name
  }
}

# 퍼블릭 라우팅 테이블 생성
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_demo.id

  tags = {
    Name = "${local.project_name}-public-rt"
  }
}

# 프라이빗 라우팅 테이블 생성
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc_demo.id

  tags = {
    Name = "${local.project_name}-private-rt"
  }
}