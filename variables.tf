variable "region" {
  default     = "us-west-2"
  description = "AWS region"
}

variable "data_type" {
  default     = "text"
  description = "Parameter data type."
}

variable "key_id" {
  type        = string
  description = "KMS key ARN."
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
  description = "SSM parameter created outside of a file."
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

variable "overwrite" {
  default = null
  type = bool
  description = "Overwrite an existing parameter."
}

variable "allowed_pattern" {
  default = null
  type = string
  description = "Regular expression used to validate parameter values."
}

variable "tags" {
	type = map(string)
	default = null
	description = "Tags to apply to your SSM Parameters.  May not be necessary if your account has auto-tagging enabled."
}