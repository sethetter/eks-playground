resource "aws_ecr_repository" "eks_playground" {
  name = "eks-playground"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_eks_cluster" "main" {
  name = "eks-playground"
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config {
    subnet_ids = concat(
      module.vpc.private_subnets,
      module.vpc.public_subnets
    )
  }
  depends_on = [
    aws_iam_role.eks_cluster,
    aws_iam_role_policy_attachment.eks_cluster-AmazonEKSClusterPolicy
  ]
}

resource "aws_eks_fargate_profile" "main" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = "main"
  pod_execution_role_arn = aws_iam_role.eks_playground_pods.arn
  subnet_ids = module.vpc.private_subnets

  selector {
    namespace = "default"
  }
}

resource "aws_eks_fargate_profile" "system" {
  cluster_name           = aws_eks_cluster.main.name
  fargate_profile_name   = "system"
  pod_execution_role_arn = aws_iam_role.eks_playground_pods.arn
  subnet_ids = module.vpc.private_subnets

  selector {
    namespace = "kube-system"
  }
}
