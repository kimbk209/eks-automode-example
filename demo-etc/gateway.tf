resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_demo.id

  tags = {
    Name = "${local.project_name}-igw"
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "${local.project_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.pubsvr_a.id

  tags = {
    Name = "${local.project_name}-nat-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}
