## S3 Bucket for state storage.

resource "aws_s3_bucket" "state" {
  bucket = var.bucket_name
  tags   = var.bucket_tags
}

resource "aws_s3_bucket_acl" "state" {
  bucket = aws_s3_bucket.state.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "state" {
  bucket                  = aws_s3_bucket.state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }
}


data "aws_iam_policy_document" "s3bucket" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
    ]
    resources = [aws_s3_bucket.state.arn]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = ["${aws_s3_bucket.state.arn}/*.tfstate"]
  }
}

resource "aws_iam_policy" "s3bucket" {
  count       = var.create_managed_policies ? 1 : 0
  name        = "s3-${aws_s3_bucket.state.bucket}"
  description = "Provides access to Terraform state S3 Bucket."
  policy      = data.aws_iam_policy_document.s3bucket.json
}
