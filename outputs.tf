output "user_name" {
  description = "The name of the Terraform IAM user."
  sensitive   = false
  value       = aws_iam_user.terraform.name
}

output "user_arn" {
  description = "The ARN of the Terraform IAM user."
  sensitive   = false
  value       = aws_iam_user.terraform.arn
}

output "user_access_key" {
  description = "The AWS_ACCESS_KEY_ID."
  sensitive   = false
  value       = aws_iam_access_key.terraform.id
}

output "user_secret_key" {
  description = "The AWS_SECRET_ACCESS_KEY."
  sensitive   = true
  value       = aws_iam_access_key.terraform.secret
}


output "backend_region" {
  description = "The region of the S3 Bucket and DynamoDB Table for state storage."
  sensitive   = false
  value       = data.aws_region.current.name
}

output "backend_bucket" {
  description = "The name of the S3 Bucket to use for state storage."
  sensitive   = false
  value       = aws_s3_bucket.state.bucket
}

output "dynamodb_table" {
  description = "The name of DynamoDB Table to use for state locking and consistency."
  sensitive   = false
  value       = aws_dynamodb_table.state.name
}
