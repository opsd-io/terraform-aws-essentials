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
