# Create SSM parameters using a JSON input file
module my_parameters_from_file {
    source = "git::https://github.com/path_to_module/ssm_module.git"
    input_file = "ssm_input.json"
    key_id = "arn:aws:kms:us-west-2:2309209292:key/21ba1676-db71-4c0e-b8be-xxxxxxxx"
    tags = {env = "non-prod", paramset = "my tag value"}
}