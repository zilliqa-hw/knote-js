data "aws_caller_identity" "current" {}
data "aws_organizations_organization" "current" {}
data "aws_region" "current" {}

locals {
  application         = "knote-js"
  caller_identity     = data.aws_caller_identity.current
  k8s_namespace       = "${local.application}-${var.environment}"
  k8s_service_account = "${local.application}-${var.environment}-service-account"
  region              = data.aws_region.current.name
  eks_oidc_issuer     = substr(data.aws_eks_cluster.eks.identity[0].oidc[0].issuer, 8, -1)

  oidc_provider_arn = "arn:aws:iam::${local.caller_identity.id}:oidc-provider/${local.eks_oidc_issuer}"

  default_tags = {
    dev = {
      account       = "Engineering - Dev"
      application   = local.application
      is-cde        = false
      is-production = false
      owner         = "aws+engineering-dev@mongodb.hu"
      terraform     = "${local.application}/zarf/terraform"
    }

    prod = {
      account       = "Engineering - Prod"
      application   = local.application
      is-cde        = false
      is-production = false
      owner         = "aws+engineering-prod@mongodb.hu"
      terraform     = "${local.application}/zarf/terraform"
    }

    shared_services = {
      account       = "Engineering - Shared Services"
      application   = local.application
      is-cde        = false
      is-production = true
      owner         = "aws+core-shared-services@mongodb.hu"
      terraform     = "${local.application}/zarf/terraform"
    }
  }
}
