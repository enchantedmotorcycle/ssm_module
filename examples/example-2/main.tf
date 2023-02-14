# Create SSM parameters from a variable or directly as an input
module my_parameters_from_variables {
    source = "git::https://github.com/path_to_module/ssm_module.git"
    key_id = var.key_arn
    ssm_parameter = var.ssm_params
}