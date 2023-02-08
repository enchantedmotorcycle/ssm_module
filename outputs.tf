output "show_data" {
  value = data.aws_kms_secrets.secure_ssm_secrets
  sensitive = true
}

output "show_locals" {
  value = local.local_data.aws_ssm_parameter
}