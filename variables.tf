variable "create_vpc" {
  description = "Create a new VPC"
  type        = bool
  default     = false
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}