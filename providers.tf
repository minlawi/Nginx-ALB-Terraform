terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.89.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "master-programmatic-admin"
}

locals {
  anywhere        = "0.0.0.0/0"
  http            = 80
  tcp_protocol    = "tcp"
  all_ports       = -1
  ssh             = 22
  server_t2_micro = "t2.micro"
}