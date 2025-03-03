resource "aws_alb" "app_lb" {
  name                       = "nginx-alb"
  internal                   = false
  security_groups            = [aws_security_group.web_sg.id]
  subnets                    = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  enable_deletion_protection = false
  tags = {
    name = "nginx-alb"
  }
}