variable "create_vpc" {
  description = "Create a new VPC"
  type        = bool
  default     = false
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = list(string)
  default     = []
}

variable "create_ec2" {
  description = "Count to create EC2 instances"
  type        = bool
  default     = false
}