# VPC Configuration
resource "aws_vpc" "nginx_vpc" {
  count                = var.create_vpc ? 1 : 0
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Nginx-VPC"
  }
}

# # Subnets (Public)
# resource "aws_subnet" "public_subnet_1" {
#   vpc_id                  = aws_vpc.nginx_vpc.id
#   cidr_block              = "10.0.0.0/20"
#   map_public_ip_on_launch = true
#   availability_zone       = "ap-southeast-1a"

#   tags = {
#     Name = "Public-Subnet-01"
#   }
# }

# resource "aws_subnet" "public_subnet_2" {
#   vpc_id                  = aws_vpc.nginx_vpc.id
#   cidr_block              = "10.0.16.0/20"
#   map_public_ip_on_launch = true
#   availability_zone       = "ap-southeast-1b"

#   tags = {
#     Name = "Public-Subnet-02"
#   }
# }

# # Internet Gateway
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.nginx_vpc.id

#   tags = {
#     Name = "Internet-Gateway"
#   }
# }

# # Route Table
# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.nginx_vpc.id
#   tags = {
#     Name = "Public-Route-Table"
#   }
# }

# resource "aws_route" "default_route" {
#   route_table_id         = aws_route_table.public_rt.id
#   destination_cidr_block = local.anywhere
#   gateway_id             = aws_internet_gateway.igw.id
# }

# resource "aws_route_table_association" "public_assoc_1" {
#   subnet_id      = aws_subnet.public_subnet_1.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table_association" "public_assoc_2" {
#   subnet_id      = aws_subnet.public_subnet_2.id
#   route_table_id = aws_route_table.public_rt.id
# }