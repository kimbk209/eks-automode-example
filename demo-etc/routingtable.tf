# Route Table Associations
# Route Table Associations - Public
resource "aws_route_table_association" "pubsvr_a_rta" {
  subnet_id      = aws_subnet.pubsvr_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "pubsvr_c_rta" {
  subnet_id      = aws_subnet.pubsvr_c.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table Associations - Private
resource "aws_route_table_association" "prvsvr_a_rta" {
  subnet_id      = aws_subnet.prvsvr_a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "prvsvr_c_rta" {
  subnet_id      = aws_subnet.prvsvr_c.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "data_a_rta" {
  subnet_id      = aws_subnet.data_a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "data_c_rta" {
  subnet_id      = aws_subnet.data_c.id
  route_table_id = aws_route_table.private_rt.id
}


# 퍼블릭 라우팅 테이블에 인터넷 게이트웨이 경로 추가
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

  # 라우팅 테이블과 IGW가 존재해야 함
  depends_on = [aws_route_table.public_rt, aws_internet_gateway.igw]
}

# 프라이빗 라우팅 테이블에 NAT 게이트웨이 경로 추가
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id

  # 라우팅 테이블과 NATGW가 존재해야 함
  depends_on = [aws_route_table.private_rt, aws_nat_gateway.nat_gw]
}