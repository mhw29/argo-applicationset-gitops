resource "aws_eks_cluster" "application_set_master" {
    name     = "argo-applicationset-master"
    role_arn = aws_iam_role.my_cluster_role.arn
    version  = "1.29" 

    vpc_config {
        subnet_ids = ["subnet-3846fb67", "subnet-73279852"]  
    }
}

resource "aws_iam_role" "argo-applicationset-master-role" {
    name = "argo-applicationset-master-role"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_eks_cluster" "application_set_node" {
    name     = "argo-applicationset-node"
    role_arn = aws_iam_role.my_cluster_role.arn
    version  = "1.29"  

    vpc_config {
        subnet_ids = ["subnet-3846fb67", "subnet-73279852"]  
    }
}

resource "aws_iam_role" "argo-applicationset-node-role" {
    name = "argo-applicationset-node-role"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}