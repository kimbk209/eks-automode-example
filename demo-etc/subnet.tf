# Public Subnets
resource "aws_subnet" "pubsvr_a" {
  vpc_id                  = aws_vpc.vpc_demo.id
  cidr_block              = local.subnets.public_a.cidr
  availability_zone       = "${local.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.project_name}-pubsvr-a",
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "pubsvr_c" {
  vpc_id                  = aws_vpc.vpc_demo.id
  cidr_block              = local.subnets.public_c.cidr
  availability_zone       = "${local.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.project_name}-pubsvr-c",
    "kubernetes.io/role/elb" = "1"
  }
}

# Private Subnets
resource "aws_subnet" "prvsvr_a" {
  vpc_id                  = aws_vpc.vpc_demo.id
  cidr_block              = local.subnets.private_a.cidr
  availability_zone       = "${local.region}a"

  tags = {
    Name = "${local.project_name}-prvsvr-a"
  }
}

resource "aws_subnet" "prvsvr_c" {
  vpc_id                  = aws_vpc.vpc_demo.id
  cidr_block              = local.subnets.private_c.cidr
  availability_zone       = "${local.region}c"

  tags = {
    Name = "${local.project_name}-prvsvr-c"
  }
}

# Data Subnets
resource "aws_subnet" "data_a" {
  vpc_id                  = aws_vpc.vpc_demo.id
  cidr_block              = local.subnets.data_a.cidr
  availability_zone       = "${local.region}a"

  tags = {
    Name = "${local.project_name}-data-a"
  }
}

resource "aws_subnet" "data_c" {
  vpc_id                  = aws_vpc.vpc_demo.id
  cidr_block              = local.subnets.data_c.cidr
  availability_zone       = "${local.region}c"

  tags = {
    Name = "${local.project_name}-data-c"
  }
}

resource "aws_db_subnet_group" "database" {
  name       = "${local.project_name}-database-subnet-group"
  subnet_ids = [aws_subnet.data_a.id, aws_subnet.data_c.id]

  tags = {
    Name = "${local.project_name}-database-subnet-group"
  }
}
