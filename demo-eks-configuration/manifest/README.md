# kube-ops-view Ingress 설정

이 디렉토리에는 kube-ops-view를 외부에서 접근할 수 있도록 하는 AWS ALB Ingress 리소스 정의가 포함되어 있습니다.

## 사전 요구 사항

1. AWS Load Balancer Controller가 EKS 클러스터에 설치되어 있어야 합니다.
2. 적절한 IAM 권한이 설정되어 있어야 합니다.

## 적용 방법

```bash
kubectl apply -f kube-ops-view-ingress.yaml
```

## 주요 설정

- Internet-facing ALB 생성
- HTTP(80)와 HTTPS(443) 포트 리스닝
- HTTP에서 HTTPS로 리디렉션
- IP 타겟 타입 사용
- 헬스체크 경로: /

## 도메인 설정

실제 환경에서 사용하기 위해서는 `kube-ops-view.demo.example.com` 도메인을 실제 사용 가능한 도메인으로 변경하고, 
해당 도메인을 Route53에 등록하거나 DNS 제공자에서 ALB의 DNS 이름으로 CNAME 레코드를 생성해야 합니다.
