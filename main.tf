terraform {
  required_version = ">= 1.3.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.0"
    }
  }
}

data "aws_region" "current" {}

## Terraform IAM user for programmatic access.

resource "aws_iam_user" "terraform" {
  name          = var.user_name
  path          = var.user_path
  tags          = var.user_tags
  force_destroy = true
}

resource "aws_iam_access_key" "terraform" {
  user = aws_iam_user.terraform.name
}

resource "aws_iam_user_policy_attachment" "additional" {
  for_each   = var.attached_policies
  user       = aws_iam_user.terraform.name
  policy_arn = each.value
}

resource "aws_iam_user_policy" "additional" {
  for_each = var.inline_policies
  user     = aws_iam_user.terraform.name
  name     = each.key
  policy   = each.value
}

# For internal access policies we're using inline policies to maintain  a strict one-to-one
# relationship between a policy and the identity (rather than reusable managed policies).

resource "aws_iam_user_policy" "s3bucket" {
  name   = "terraform-backend-s3bucket"
  user   = aws_iam_user.terraform.name
  policy = data.aws_iam_policy_document.s3bucket.json
}

resource "aws_iam_user_policy" "dynamodb" {
  name   = "terraform-backend-dynamodb"
  user   = aws_iam_user.terraform.name
  policy = data.aws_iam_policy_document.dynamodb.json
}

# Skip if var.assume_role_arns is empty. Otherwise it would allow ANY role!
resource "aws_iam_user_policy" "assume_role" {
  count  = min(length(var.assume_role_arns), 1)
  name   = "terraform-assume-role"
  user   = aws_iam_user.terraform.name
  policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    resources = var.assume_role_arns
  }
}
