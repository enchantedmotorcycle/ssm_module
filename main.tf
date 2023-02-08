locals {
  #local_data = jsondecode(file(var.input_file))
  local_data = var.input_file != null ? jsondecode(file(var.input_file)) : var.ssm_parameter
  
  #raw_value = yamldecode(file("${path.module}/example.yaml"))
  #normalized_value = {
  #  name   = tostring(try(local.raw_value.name, null))
  #  groups = try(local.raw_value.groups, [])
  #}

   
}

output "show_locals" {
  value = local.local_data.aws_ssm_parameter
}


resource "aws_ssm_parameter" "secure_ssm_params" {
  for_each = {
    for param in local.local_data.aws_ssm_parameter : param.ssm_param_name => param if param.ssm_param_type == "SecureString"
  }
  name        = each.key
  description = can(each.value.ssm_param_description) ? each.value.ssm_param_description : null
  type        = "SecureString"
  value       = data.aws_kms_secrets.secure_ssm_secrets[each.key].plaintext[each.key]
  tier        = each.value.ssm_param_tier
  #value       = "temp"
  key_id      = var.key_id

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
  description = can(each.value.ssm_param_description) ? each.value.ssm_param_description : null
  type        = "String"
  value       = each.value.ssm_param_value
  tier        = each.value.ssm_param_tier
  #value       = "temp"
  key_id      = var.key_id

  tags = {
    environment = "production"
  }
}

