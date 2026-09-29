variable "ami_id_singapore" {
  description = "AMI ID for Singapore region"
  type        = string
}

variable "ami_id_mumbai" {
  description = "AMI ID for Mumbai region"
  type        = string
}

variable "instance_configs" {
  description = "EC2 configurations for each environment"

  type = map(object({
    instance_type = string
  }))
}

variable "create_extra_instances" {
  description = "Create 2 additional EC2 instances for selected environment"
  type        = bool
  default     = false
}