variable "owner" {
  type = string
}

variable "cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "public_cidr" {
  type = list(string)
}

variable "private_cidr" {
  type = list(string)
}

variable "private_subnet_names" {
  type = list(string)
}

variable "public_subnet_names" {
  type = list(string)
}

variable "lb-type" {
  type = string
}

variable "health_check_type" {
  type = string
}

variable "lb-port" {
  type = number
}

variable "lb-protocol" {
  type = string
}

variable "tg-type" {
  type = string
}

variable "stickiness-enabled" {
  type = bool
}

variable "stickiness-type" {
  type = string
}

variable "alb-sg-name" {
  type = string
}

variable "app-sg-name" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "launch_template_name" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

variable "instance_type" {
  type = string
}

variable "policy_type" {
  type = string
}

variable "target" {
  type = number
}

variable "db-sg-name" {
  type = string
}

variable "db-engine" {
  type = string
}

variable "db-engine_version" {
  type = string
}

variable "db-instance_class" {
  type = string
}

variable "db-storage" {
  type = number
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "db-port" {
  type = string
}

variable "db-family" {
  type = string
}

variable "db-identifier" {
  type = string
}

variable "iam_role_asg" {
  type = map(string)
}

variable "iam_role_name_ssm_asg" {
  type = string
}
