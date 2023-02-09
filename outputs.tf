output "show_data" {
  value = data.aws_kms_secrets.secure_ssm_secrets
  sensitive = true
}

output "show_locals" {
  value = local.local_data.aws_ssm_parameter
}

output "parameters" {
  value = aws_ssm_parameter.ssm_params
}

output "secure_parameters" {
  value = aws_ssm_parameter.secure_ssm_params
}