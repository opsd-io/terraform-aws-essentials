<a href="https://www.opsd.io" target="_blank"><img alt="OPSd" src=".github/img/OPSD_logo.svg" width="180px"></a>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-template

## Introduction

What does the module provide?

## Usage

```hcl
module "module_name" {
  source  = "github.com/opsd-io/module_name"
  version = ">= 0.1.0"

  # Variables
  variable_name     = foo
  variable_password = bar
}
```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_access_key.terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy.s3bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy_attachment.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_arns"></a> [assume\_role\_arns](#input\_assume\_role\_arns) | A set of IAM roles that Terraform IAM user will be able to assume.<br>These roles are for accounts management and should have the AdministratorAccess policy attached.<br>By default, all `terraform` roles are allowed from every account, as far as role's assume policy allows. | `set(string)` | <pre>[<br>  "arn:aws:iam::*:role/terraform"<br>]</pre> | no |
| <a name="input_attached_policies"></a> [attached\_policies](#input\_attached\_policies) | Additional attached policies' ARNs for Terraform user. | `map(string)` | `{}` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 Bucket to use for state storage. | `string` | n/a | yes |
| <a name="input_bucket_tags"></a> [bucket\_tags](#input\_bucket\_tags) | A map of tags to assign to the bucket. | `map(string)` | `{}` | no |
| <a name="input_create_managed_policies"></a> [create\_managed\_policies](#input\_create\_managed\_policies) | If set to true, creates managed policies to grant | `bool` | `false` | no |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | The name of DynamoDB Table to use for state locking and consistency. | `string` | `"terraform-state-locks"` | no |
| <a name="input_dynamodb_table_tags"></a> [dynamodb\_table\_tags](#input\_dynamodb\_table\_tags) | A map of tags to assign to the table. | `map(string)` | `{}` | no |
| <a name="input_inline_policies"></a> [inline\_policies](#input\_inline\_policies) | Additional inline policies for Terraform user. | `map(string)` | `{}` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the Terraform IAM user. | `string` | `"terraform"` | no |
| <a name="input_user_path"></a> [user\_path](#input\_user\_path) | The path for the Terraform IAM user. | `string` | `"/"` | no |
| <a name="input_user_tags"></a> [user\_tags](#input\_user\_tags) | A map of tags assigned to the Terraform IAM user. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the S3 Bucket. |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the S3 Bucket to use for state storage. |
| <a name="output_dynamodb_table_arn"></a> [dynamodb\_table\_arn](#output\_dynamodb\_table\_arn) | The ARN of the DynamoDB Table. |
| <a name="output_dynamodb_table_name"></a> [dynamodb\_table\_name](#output\_dynamodb\_table\_name) | The name of DynamoDB Table to use for state locking and consistency. |
| <a name="output_region"></a> [region](#output\_region) | The region of the state storage resources. |
| <a name="output_user_access_key"></a> [user\_access\_key](#output\_user\_access\_key) | The AWS\_ACCESS\_KEY\_ID. |
| <a name="output_user_arn"></a> [user\_arn](#output\_user\_arn) | The ARN of the Terraform IAM user. |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | The name of the Terraform IAM user. |
| <a name="output_user_secret_key"></a> [user\_secret\_key](#output\_user\_secret\_key) | The AWS\_SECRET\_ACCESS\_KEY. |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Related modules

The list of related modules (if present).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)
