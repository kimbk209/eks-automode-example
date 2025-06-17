resource "aws_security_group" "bastion_sg" {
  name        = "${local.project_name}-bastion-sg-mgmt"
  description = "${local.project_name}-bastion-sg-mgmt"
  vpc_id      = aws_vpc.vpc_demo.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.project_name}-bastion-sg-mgmt"
  }
}