data "aws_kms_secrets" "secure_ssm_secrets" {
  for_each = {
    for param in local.local_data.aws_ssm_parameter : param.ssm_param_name => param if param.ssm_param_type == "SecureString"
  }
  secret {
    name    = each.key
    payload = each.value.ssm_param_value
    encryption_algorithm = var.encryption_algorithm != null ? var.encryption_algorithm : null
    key_id               = var.encryption_algorithm != null ? var.key_id : null
  }
}
