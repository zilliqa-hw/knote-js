module "ecr" {
  count = var.environment == "dev" ? 1 : 0

  providers = {
    aws.default                      = aws
    aws.root-eu-central-1            = aws.root-eu-central-1
    aws.shared-services-eu-central-1 = aws.shared-services-eu-central-1
  }
  source = "git@github.com:zilliqa-hw/infra.git//terraform/modules/aws-ecr-apps"

  namespace = "thirdparty"
  name      = local.application
}
