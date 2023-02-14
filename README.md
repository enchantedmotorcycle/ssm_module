<!-- BEGIN_TF_DOCS -->
# Terraform SSM Parameter Module

This module can be used to create AWS SSM Parameters accepting input from a structured JSON file or from Terraform variables/direct input text.  See below for examples on usage and required module inputs.

## Example

```hcl
# Create SSM parameters using a JSON input file
module my_parameters_from_file {
    source = "git::https://github.com/path_to_module/ssm_module.git"
    input_file = var.input_file
    key_id = var.key_arn
    tags = var.tags
}

# Create SSM parameters from a variable or directly as an input
module my_parameters_from_variables {
    source = "git::https://github.com/path_to_module/ssm_module.git"
    key_id = var.key_arn
    ssm_parameter = var.ssm_params
}

# Example using the created SSM parameter in a secret
resource "aws_secretsmanager_secret" "ssm_param_secret" {
  name = "${module.my_parameters_from_file.all_parameters["/prd/my-parameter"].name}"
}

# Example using the created SSM parameter as a secret value
resource "aws_secretsmanager_secret_version" "ssm_param_secret_version" {
  secret_id     = aws_secretsmanager_secret.chicken_dinner_secret.id
  secret_string = "${module.my_parameters_from_file.all_parameters["/prd/my-parameter"].value}"
}
```

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