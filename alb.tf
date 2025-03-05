# 1. Create Target Group
resource "aws_lb_target_group" "app_tg" {
  count       = var.create_vpc ? 1 : 0
  name        = "nginx-tg"
  port        = local.http_port
  protocol    = local.http_protocol
  vpc_id      = aws_vpc.nginx_vpc[0].id
  target_type = "instance"
  tags = {
    name = "nginx-tg"
  }
  #   health_check {
  #   interval            = 30                      // ALB performs health checks every 30 seconds
  #   path                = "/"                     // Health check path
  #   port                = local.http_port         // Health check port
  #   protocol            = local.http_protocol     // Health check protocol
  #   timeout             = 5                       // Health check timeout                            
  #   healthy_threshold   = 2                       // Number of consecutive successful health checks required before considering the target healthy
  #   unhealthy_threshold = 2                       // Number of consecutive failed health checks required before considering the target unhealthy 
  #   matcher             = "200"                   // HTTP code to expect in the response from the target
  # }
}

# 2. Register Targets
resource "aws_lb_target_group_attachment" "tg_attachment" {
  count            = var.create_vpc ? length(aws_instance.nginx_instances) : 0
  target_group_arn = aws_lb_target_group.app_tg[0].arn
  target_id        = aws_instance.nginx_instances[count.index].id
  port             = local.http_port
}

# 3. Create Application Load Balancer
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

# 4. Create Listener
resource "aws_lb_listener" "listener" {
  count             = var.create_vpc ? 1 : 0
  load_balancer_arn = aws_alb.app_lb[0].arn
  port              = local.http_port
  protocol          = local.http_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg[0].arn
  }
}
