resource "aws_alb" "app_lb" {
  count              = var.create_vpc ? 1 : 0
  load_balancer_type = "application"
  name               = "nginx-alb"
  internal           = false
  security_groups    = [aws_security_group.web_sg[0].id]
  subnets            = aws_subnet.public_subnet[*].id
  tags = {
    name = "nginx-alb"
  }
}

resource "aws_lb_target_group" "app_tg" {
  count       = var.create_vpc ? 1 : 0
  name        = "nginx-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.nginx_vpc[0].id
  target_type = "instance"
  tags = {
    name = "nginx-tg"
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  count            = var.create_vpc ? length(aws_instance.nginx_instances) : 0
  target_group_arn = aws_lb_target_group.app_tg[0].arn
  target_id        = aws_instance.nginx_instances[count.index].id
  port             = 80
}

resource "aws_lb_listener" "listener" {
  count             = var.create_vpc ? 1 : 0
  load_balancer_arn = aws_alb.app_lb[0].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg[0].arn
  }
}