## DynamoDB Table for state locking.

resource "aws_dynamodb_table" "state" {
  name         = var.dynamodb_table_name
  tags         = var.dynamodb_table_tags
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}


data "aws_iam_policy_document" "dynamodb" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
    ]
    resources = [aws_dynamodb_table.state.arn]
  }
}

resource "aws_iam_policy" "dynamodb" {
  count       = var.create_managed_policies ? 1 : 0
  name        = "dynamodb-${aws_dynamodb_table.state.name}"
  description = "Provides access to Terraform state DynamoDB table."
  policy      = data.aws_iam_policy_document.dynamodb.json
}
