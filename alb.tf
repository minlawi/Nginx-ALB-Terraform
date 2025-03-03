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

resource "aws_lb_target_group" "app_tg" {
  name        = "nginx-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.nginx_vpc.id
  target_type = "instance"
  tags = {
    name = "nginx-tg"
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  for_each         = toset(aws_instance.nginx_server[*].id)
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = each.value
  port             = 80
}