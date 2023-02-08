variable "region" {
  default     = "us-west-2"
}

variable "data_type" {
  default     = "text"
}

variable "key_id" {
  type        = string
}

variable "ssm_parameter" {
  type = object(
    {
    aws_ssm_parameter = list(object({
    ssm_param_name    = string
    ssm_param_tier    = string
    ssm_param_type    = string
    ssm_param_value   = string
    ssm_param_description   = optional(string)
  }
    ))
    }
  )
  default = null
}

variable "input_file" {
  default     = null
  description = "Input file with AWS SSM Parameters."
  type        = string
  #validation {
  #  condition     = length(var.input_file) > 1
  #  error_message = "Input file path cannot be blank"
  #}
  #validation {
  #  condition     = length(var.ssm_parameter) < 1
  #  error_message = "Cannot specify both an input file and a parameter"
  #}
}

variable "encryption_algorithm" {
  default = null
  description = "Encryption algorithm if a secure SSM Param is not built with a KMS cipherblob"
  type    = string
}