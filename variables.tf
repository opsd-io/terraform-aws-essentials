variable "user_name" {
  description = "The name of the Terraform IAM user."
  type        = string
  default     = "terraform"
}

variable "user_path" {
  description = "The path for the Terraform IAM user."
  type        = string
  default     = "/"
}

variable "user_tags" {
  description = "A map of tags assigned to the Terraform IAM user."
  type        = map(string)
  default     = {}
}

variable "attached_policies" {
  description = "Additional attached policies' ARNs for Terraform user."
  type        = map(string)
  default     = {}
}

variable "inline_policies" {
  description = "Additional inline policies for Terraform user."
  type        = map(string)
  default     = {}
}

variable "assume_role_arns" {
  description = <<-EOF
    A set of IAM roles that Terraform IAM user will be able to assume.
    These roles are for accounts management and should have the AdministratorAccess policy attached.
    By default, all `terraform` roles are allowed from every account, as far as role's assume policy allows.
  EOF
  type        = set(string)
  default     = ["arn:aws:iam::*:role/terraform"]
}


variable "bucket_name" {
  description = "The name of the S3 Bucket to use for state storage."
  type        = string
}

variable "bucket_server_side_encryption" {
  description = "If true, enables S3 bucket server-side encryption."
  type        = bool
  default     = true
}

variable "bucket_tags" {
  description = "A map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}


variable "dynamodb_table_name" {
  description = "The name of DynamoDB Table to use for state locking and consistency."
  type        = string
  default     = "terraform-state-locks"
}

variable "dynamodb_table_tags" {
  description = "A map of tags to assign to the table."
  type        = map(string)
  default     = {}
}

variable "create_managed_policies" {
  description = "If set to true, creates managed policies to grant "
  type        = bool
  default     = false
}
