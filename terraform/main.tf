

module "eks" {
    source = "./aws/eks"
}


resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "6.6.0"

  namespace  = "argocd"

  values = [file("${path.module}/kubernetes/argocd/values.yaml")]

  # Ensure the namespace exists
  depends_on = [
    kubernetes_namespace.argo
  ]
}

resource "kubernetes_namespace" "argo" {
  metadata {
    name = "argocd"
  }

  depends_on = [
    resource.aws_eks_cluster.application_set_master,
  ]
}