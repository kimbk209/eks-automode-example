output "cluster_endpoint" {
  description = "EKS 클러스터 엔드포인트"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "EKS 클러스터 인증 기관 데이터"
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_name" {
  description = "EKS 클러스터 이름"
  value       = module.eks.cluster_name
}

output "cluster_oidc_issuer_url" {
  description = "EKS 클러스터 OIDC 발급자 URL"
  value       = module.eks.cluster_oidc_issuer_url
}

output "cluster_version" {
  description = "EKS 클러스터 버전"
  value       = module.eks.cluster_version
}

output "cluster_arn" {
  description = "EKS 클러스터 ARN"
  value       = module.eks.cluster_arn
}


output "node_security_group_id" {
  description = "EKS 노드 보안 그룹 ID"
  value       = module.eks.node_security_group_id
}

output "cluster_security_group_id" {
  description = "EKS 클러스터 보안 그룹 ID"
  value       = module.eks.cluster_security_group_id
}