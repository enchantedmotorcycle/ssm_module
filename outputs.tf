#output "show_data" {
#  value = data.aws_kms_secrets.secure_ssm_secrets
#  sensitive = true
#}

#output "show_locals" {
#  value = local.local_data.aws_ssm_parameter
#}

# output "parameters" {
#   #value = aws_ssm_parameter.ssm_params.name
#   # value = [
#   #   for param in aws_ssm_parameter.ssm_params.name : param.name
#   # ]
#   value = values(aws_ssm_parameter.ssm_params)[*]
#   sensitive = true
# }

# output "parameters_name" {
#   #value = aws_ssm_parameter.ssm_params.name
#   # value = [
#   #   for param in aws_ssm_parameter.ssm_params.name : param.name
#   # ]
#   value = values(aws_ssm_parameter.ssm_params)[*].name
#   #sensitive = true
# }

# output "parameters_value" {
#   #value = aws_ssm_parameter.ssm_params.name
#   # value = [
#   #   for param in aws_ssm_parameter.ssm_params.name : param.name
#   # ]
#   value = values(aws_ssm_parameter.ssm_params)[*].value
#   sensitive = true
# }
# output "secure_parameters" {
#   value = aws_ssm_parameter.secure_ssm_params.name
#   sensitive = true
# }
output "all_parameters" {
  #value = aws_ssm_parameter.ssm_params.name
  # value = [
  #   for param in aws_ssm_parameter.ssm_params.name : param.name
  # ]
  value = values(local.all_names)[*]
  sensitive = true
}

output "all_parameters_name" {
  #value = aws_ssm_parameter.ssm_params.name
  # value = [
  #   for param in aws_ssm_parameter.ssm_params.name : param.name
  # ]
  value = values(local.all_names)[*].name
}

output "all_parameters_value" {
  #value = aws_ssm_parameter.ssm_params.name
  # value = [
  #   for param in aws_ssm_parameter.ssm_params.name : param.name
  # ]
  value = values(local.all_names)[*].value
  sensitive = true
}