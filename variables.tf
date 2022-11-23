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
