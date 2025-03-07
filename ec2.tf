resource "aws_instance" "nginx_instances" {
  count                       = var.create_vpc ? length(data.aws_availability_zones.available.names) : 0
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = local.server_t2_micro
  subnet_id                   = aws_subnet.public_subnet[count.index].id
  availability_zone           = data.aws_availability_zones.available.names[count.index]
  associate_public_ip_address = true
  security_groups             = [aws_security_group.web_sg[0].id]
  user_data                   = file("${path.root}/scripts/nginx-install.sh")
  user_data_replace_on_change = true
  tags = {
    Name = "Nginx-Server-${count.index}"
  }
  lifecycle {
    ignore_changes = [
      security_groups
    ]
  }
}
