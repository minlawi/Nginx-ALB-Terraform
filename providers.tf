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
  profile = var.profile
}

locals {
  anywhere        = "0.0.0.0/0"
  http_port       = 80
  http_protocol   = "HTTP"
  tcp_protocol    = "tcp"
  all_ports       = -1
  ssh             = 22
  server_t2_micro = "t2.micro"
}