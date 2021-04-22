variable "createdby" {
  type = string
  default = "packer"
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "security_group_name" {
  type = string
}

variable "cidrs" {
  type = list(string)
}