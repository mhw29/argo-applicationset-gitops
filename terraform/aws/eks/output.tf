output "argo_applicationset_master_endpoint" {
  value = aws_eks_cluster.application_set_master.endpoint
  description = "The endpoint for the Argo ApplicationSet master EKS cluster."
}

output "argo_applicationset_master_certificate_authority" {
  value = aws_eks_cluster.application_set_master.certificate_authority[0].data
  description = "The certificate authority data for the Argo ApplicationSet master EKS cluster."
}

output "argo_applicationset_master_token" {
  value = aws_eks_cluster.application_set_master.token
}

output "argo_applicationset_node_endpoint" {
  value = aws_eks_cluster.application_set_node.endpoint
  description = "The endpoint for the Argo ApplicationSet node EKS cluster."
}

output "argo_applicationset_node_certificate_authority" {
  value = aws_eks_cluster.application_set_node.certificate_authority[0].data
  description = "The certificate authority data for the Argo ApplicationSet node EKS cluster."
}
