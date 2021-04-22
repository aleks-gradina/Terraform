variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "endpoint_public_access" {
  type    = string
  default = true
}

variable "endpoint_private_access" {
  type    = string
  default = true
}

variable "eks_node_disk_size" {
  type    = string
  default = "100"
}

variable "eks_node_instance_type" {
  type    = list(string)
  default = ["t3.small"]
}

variable "eks_node_group_name" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "eks_cluster_role_arn" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "pod_execution_role_arn" {
  type = string
}

variable "general_desired_size" {
  type = number
}

variable "general_max_size" {
  type = number
}

variable "general_min_size" {
  type = number
}

variable "eks_kms_key_description" {
  type = string
}