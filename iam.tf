#Configure the OIDC provider in AWS account:
resource "aws_iam_openid_connect_provider" "default" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = ["ffffffffffffffffffffffffffffffffffffffff"]
}

# Create the template of the policy:
data "aws_iam_policy_document" "oidc" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.default.arn]
    }

    condition {
      test     = "StringEquals"
      values   = ["sts.amazonaws.com"]
      variable = "token.actions.githubusercontent.com:aud"
    }

    condition {
      test     = "StringLike"
      values   = ["repo:${var.github_username}/${var.github_repo}:*"] # Adjust this to your GitHub username and repository
      variable = "token.actions.githubusercontent.com:sub"
    }
  }
}

# Create the role and attach the policy:
resource "aws_iam_role" "github_actions_role" {
  name               = "GitHubActionsRole"
  assume_role_policy = data.aws_iam_policy_document.oidc.json

  tags = {
    Name = "GitHub Actions Role"
  }
}

# Attach the policy to the role:
resource "aws_iam_role_policy_attachment" "github_actions_policies" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.github_actions_role.name
  policy_arn = each.value
}
