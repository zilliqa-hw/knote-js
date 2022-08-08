# Default AWS account
provider "aws" {
  region  = "eu-central-1"
  profile = "z-engineering-${var.environment}-cicd"

  default_tags {
    tags = local.default_tags[var.environment]
  }
}

provider "aws" {
  region  = "eu-central-1"
  alias   = "shared-services-eu-central-1"
  profile = "z-shared-services-cicd"

  default_tags {
    tags = local.default_tags["shared_services"]
  }
}

provider "aws" {
  region  = "eu-central-1"
  alias   = "root-eu-central-1"
  profile = "z-root-cicd"
}

data "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = var.eks_cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.eks.token
}
