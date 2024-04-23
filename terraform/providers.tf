terraform {
  cloud {
    organization = "mahwill29"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {
      name = "argo-applicationset-gitops"
    }
  }
}

provider "aws" {
    region = "us-east-1" 
}

data "aws_eks_cluster" "default" {
  depends_on          = [module.eks]
  name                = "gitops-eks"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.default.argo_applicationset_master_endpoint
    token                  = data.aws_eks_cluster_auth.default.argo_applicationset_master_token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.argo_applicationset_master_certificate_authority)
  }
}

provider "kubernetes" {
    host                   = data.aws_eks_cluster.default.argo_applicationset_master_endpoint
    token                  = data.aws_eks_cluster_auth.default.argo_applicationset_master_token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.argo_applicationset_master_certificate_authority)
} 

