# resource "kubernetes_namespace" "kube_ops_view" {
#   metadata {
#     name = "kube-ops-view"
#   }
# }

# resource "kubenetes_ingressclass" "alb" {
#   metadata {
#     name = "alb"
#   }
#   spec {
#     controller = "eks.amazonaws.com/alb"
#   }
# }

resource "helm_release" "kube_ops_view" {
  name       = "kube-ops-view"
  repository = "https://geek-cookbook.github.io/charts/"
  chart      = "kube-ops-view"
  namespace  = "kube-system"
  create_namespace = false
  
  # Set timeout for Helm operations
  timeout = 600

  # Set chart version
  version = "1.2.2"
  
  # Values for the Helm chart - 최소한의 설정만 유지
  values = [
    <<-EOT
    env:
      TZ: "Asia/Seoul"
    labels:
      app.kubernetes.io/name: kube-ops-view
    EOT
  ]

  # Depends on the remote state data
  depends_on = [
    data.terraform_remote_state.eks,
    # kubernetes_namespace.kube_ops_view
  ]

  # Add timezone setting
  set {
    name  = "env.TZ"
    value = "Asia/Seoul"
  }
  
  # 서비스 셀렉터와 일치하는 라벨 설정
  set {
    name  = "commonLabels.app"
    value = "kube-ops-view"
  }

}

# # 포트 포워딩을 위한 null_resource
# resource "null_resource" "port_forward" {
#   # Helm 배포가 완료된 후 실행
#   depends_on = [helm_release.kube_ops_view]

#   # 로컬 실행 명령어
#   provisioner "local-exec" {
#     command = "kubectl port-forward deployment/kube-ops-view -n kube-system 8080:8080 &"
#     interpreter = ["bash", "-c"]
#   }
# }
