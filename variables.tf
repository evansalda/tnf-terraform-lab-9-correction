variable "vpc" {
  type = string
}

variable "environnement" {
  type = string
}

variable "digit" {
  type = string
}

variable "elb_subnets" {
  type = list(string)
}

variable "ec2_subnet" {
  type = string
}

variable "ec2_type" {
  type = string
}