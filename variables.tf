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


variable "bucket_name" {
  description = "The name of the S3 Bucket to use for state storage."
  type        = string
}

variable "bucket_tags" {
  description = "A map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}


variable "dynamodb_table" {
  description = "The name of DynamoDB Table to use for state locking and consistency."
  type        = string
  default     = "terraform-state-locks"
}
