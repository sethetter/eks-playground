output "endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "ecr-repository-url" {
  value = aws_ecr_repository.eks_playground.repository_url
}
