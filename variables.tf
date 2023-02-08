variable "region" {
  default     = "us-west-2"
}

variable "data_type" {
  default     = "text"
}

variable "key_id" {
}

variable "ssm_parameter" {
  type = list(object({
    ssm_param_name    = string
    ssm_param_tier    = string
    ssm_param_type    = string
    ssm_param_value   = string
  }))
  default = null
}

variable "input_file" {
  default     = "ssm_input.json"
  description = "Input file with AWS SSM Parameters."
  #type        = list(string)
  validation {
    condition     = length(var.input_file) > 1
    error_message = "Input file path cannot be blank"
  }
  #validation {
  #  condition     = length(var.ssm_parameter) < 1
  #  error_message = "Cannot specify both an input file and a parameter"
  #}
}