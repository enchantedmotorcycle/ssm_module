<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_ssm_parameter.secure_ssm_params](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) (resource)
- [aws_ssm_parameter.ssm_params](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) (resource)
- [aws_kms_secrets.secure_ssm_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_secrets) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_key_id"></a> [key\_id](#input\_key\_id)

Description: KMS key ARN.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allowed_pattern"></a> [allowed\_pattern](#input\_allowed\_pattern)

Description: Regular expression used to validate parameter values.

Type: `string`

Default: `null`

### <a name="input_data_type"></a> [data\_type](#input\_data\_type)

Description: Parameter data type.

Type: `string`

Default: `"text"`

### <a name="input_encryption_algorithm"></a> [encryption\_algorithm](#input\_encryption\_algorithm)

Description: Encryption algorithm if a secure SSM Param is not built with a KMS cipherblob

Type: `string`

Default: `null`

### <a name="input_input_file"></a> [input\_file](#input\_input\_file)

Description: Input file with AWS SSM Parameters.

Type: `string`

Default: `null`

### <a name="input_overwrite"></a> [overwrite](#input\_overwrite)

Description: Overwrite an existing parameter.

Type: `bool`

Default: `null`

### <a name="input_region"></a> [region](#input\_region)

Description: AWS region

Type: `string`

Default: `"us-west-2"`

### <a name="input_ssm_parameter"></a> [ssm\_parameter](#input\_ssm\_parameter)

Description: SSM parameter created outside of a file.

Type:

```hcl
object(
    {
    aws_ssm_parameter = list(object({
    ssm_param_name    = string
    ssm_param_tier    = string
    ssm_param_type    = string
    ssm_param_value   = string
    ssm_param_description   = optional(string)
  }
    ))
    }
  )
```

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Tags to apply to your SSM Parameters.  May not be necessary if your account has auto-tagging enabled.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_all_parameters"></a> [all\_parameters](#output\_all\_parameters)

Description: output "parameters\_value" { #value = aws\_ssm\_parameter.ssm\_params.name # value = [ #   for param in aws\_ssm\_parameter.ssm\_params.name : param.name # ] value = values(aws\_ssm\_parameter.ssm\_params)[*].value sensitive = true } output "secure\_parameters" { value = aws\_ssm\_parameter.secure\_ssm\_params.name sensitive = true }

### <a name="output_all_parameters_name"></a> [all\_parameters\_name](#output\_all\_parameters\_name)

Description: n/a

### <a name="output_all_parameters_value"></a> [all\_parameters\_value](#output\_all\_parameters\_value)

Description: n/a
<!-- END_TF_DOCS -->