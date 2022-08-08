data "aws_iam_policy_document" "app-assume-role-policy" {
  version = "2012-10-17"

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${local.caller_identity.id}:oidc-provider/${local.eks_oidc_issuer}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.eks_oidc_issuer}:sub"

      values = [
        # This service account, the namespace is created and managed by Gitlab.
        "system:serviceaccount:${local.k8s_namespace}:${local.k8s_service_account}",
      ]
    }
  }
}

# Create an IAM role for AWS Support service access
resource "aws_iam_role" "app" {
  name               = "ZilliqaApplicationKnote"
  assume_role_policy = data.aws_iam_policy_document.app-assume-role-policy.json
}

data "aws_iam_policy_document" "app" {
  version = "2012-10-17"
}
