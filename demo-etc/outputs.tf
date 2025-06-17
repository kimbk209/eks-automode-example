


# VPC 관련 출력
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc_demo.id
}

output "private_subnet_ids" {
  description = "프라이빗 서브넷 ID 목록"
  value       = [aws_subnet.prvsvr_a.id, aws_subnet.prvsvr_c.id]
}

# Bastion 관련 출력
output "bastion_role_arn" {
  description = "Bastion 역할 ARN"
  value       = aws_iam_role.bastion_role.arn
}

output "bastion_sg_id" {
  description = "Bastion 보안 그룹 ID"
  value       = aws_security_group.bastion_sg.id
}
