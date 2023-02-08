locals {
  #local_data = jsondecode(file(var.input_file))
  local_data = var.input_file != "" ? jsondecode(file(var.input_file)) : var.ssm_parameter

    # lifecycle {
    #     precondition {
    #     condition     = var.input_file && var.ssm_parameter
    #     error_message = "Cannot specify both an input file and individual SSM Parameters."
    #     }
    # }
}

output "show_locals" {
  value = local.local_data.aws_ssm_parameter
}


resource "aws_ssm_parameter" "secure_ssm_params" {
  for_each = {
    for param in local.local_data.aws_ssm_parameter : param.ssm_param_name => param if param.ssm_param_type == "SecureString"
  }
  name        = each.key
  description = "The parameter description"
  type        = "SecureString"
  value       = data.aws_kms_secrets.secure_ssm_secrets[each.key].plaintext[each.key]
  #value       = "temp"
  #key_id      = "key_id"

  tags = {
    environment = "production"
  }
}

data "aws_kms_secrets" "secure_ssm_secrets" {
  for_each = {
    for param in local.local_data.aws_ssm_parameter : param.ssm_param_name => param if param.ssm_param_type == "SecureString"
  }
  secret {
    name    = each.key
    payload = each.value.ssm_param_value
  }
}

output "show_data" {
  value = data.aws_kms_secrets.secure_ssm_secrets
  sensitive = true
}

resource "aws_ssm_parameter" "ssm_params" {
  for_each = {
    for param in local.local_data.aws_ssm_parameter : param.ssm_param_name => param if param.ssm_param_type == "String"
  }
  name        = each.key
  description = "The parameter description"
  type        = "String"
  value       = each.value.ssm_param_value
  #value       = "temp"
  #key_id      = "key_id"

  tags = {
    environment = "production"
  }
}

