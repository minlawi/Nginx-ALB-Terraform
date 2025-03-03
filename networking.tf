# VPC Configuration
resource "aws_vpc" "nginx_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Nginx-VPC"
  }
}

# Subnets (Public)
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.nginx_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"

  tags = {
    Name = "Public-Subnet-01"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.nginx_vpc.id

  tags = {
    Name = "Internet-Gateway"
  }
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.nginx_vpc.id
  tags = {
    Name = "Public-Route-Table"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}