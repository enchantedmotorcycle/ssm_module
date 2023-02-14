# Create SSM parameters using a JSON input file
module my_parameters_from_file {
    source = "git::https://github.com/path_to_module/ssm_module.git"
    input_file = var.input_file
    key_id = var.key_arn
    tags = var.tags
}

# Example using the created SSM parameter in a secret
resource "aws_secretsmanager_secret" "ssm_param_secret" {
  name = "${module.my_parameters_from_file.all_parameters["/prd/my-parameter"].name}"
}

# Example using the created SSM parameter as a secret value
resource "aws_secretsmanager_secret_version" "ssm_param_secret_version" {
  secret_id     = aws_secretsmanager_secret.ssm_param_secret.id
  secret_string = "${module.my_parameters_from_file.all_parameters["/prd/my-parameter"].value}"
}