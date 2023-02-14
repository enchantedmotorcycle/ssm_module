<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.secure_ssm_params](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.ssm_params](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_kms_secrets.secure_ssm_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_secrets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_pattern"></a> [allowed\_pattern](#input\_allowed\_pattern) | Regular expression used to validate parameter values. | `string` | `null` | no |
| <a name="input_data_type"></a> [data\_type](#input\_data\_type) | Parameter data type. | `string` | `"text"` | no |
| <a name="input_encryption_algorithm"></a> [encryption\_algorithm](#input\_encryption\_algorithm) | Encryption algorithm if a secure SSM Param is not built with a KMS cipherblob | `string` | `null` | no |
| <a name="input_input_file"></a> [input\_file](#input\_input\_file) | Input file with AWS SSM Parameters. | `string` | `null` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | KMS key ARN. | `string` | n/a | yes |
| <a name="input_overwrite"></a> [overwrite](#input\_overwrite) | Overwrite an existing parameter. | `bool` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-west-2"` | no |
| <a name="input_ssm_parameter"></a> [ssm\_parameter](#input\_ssm\_parameter) | SSM parameter created outside of a file. | <pre>object(<br>    {<br>    aws_ssm_parameter = list(object({<br>    ssm_param_name    = string<br>    ssm_param_tier    = string<br>    ssm_param_type    = string<br>    ssm_param_value   = string<br>    ssm_param_description   = optional(string)<br>  }<br>    ))<br>    }<br>  )</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to your SSM Parameters.  May not be necessary if your account has auto-tagging enabled. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_parameters"></a> [all\_parameters](#output\_all\_parameters) | output "parameters\_value" { #value = aws\_ssm\_parameter.ssm\_params.name # value = [ #   for param in aws\_ssm\_parameter.ssm\_params.name : param.name # ] value = values(aws\_ssm\_parameter.ssm\_params)[*].value sensitive = true } output "secure\_parameters" { value = aws\_ssm\_parameter.secure\_ssm\_params.name sensitive = true } |
| <a name="output_all_parameters_name"></a> [all\_parameters\_name](#output\_all\_parameters\_name) | n/a |
| <a name="output_all_parameters_value"></a> [all\_parameters\_value](#output\_all\_parameters\_value) | n/a |
<!-- END_TF_DOCS -->