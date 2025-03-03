# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"] # Canonical

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# resource "aws_instance" "nginx_server" {
#   count                       = 2
#   ami                         = data.aws_ami.ubuntu.id
#   instance_type               = local.server_t2_micro
#   subnet_id                   = element([aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id], count.index)
#   associate_public_ip_address = true
#   security_groups             = [aws_security_group.web_sg.id]
#   user_data                   = file("${path.root}/config/nginx-install.sh")
#   tags = {
#     Name = "Nginx-Server-${count.index + 1}"
#   }
#   lifecycle {
#     ignore_changes = [
#       security_groups
#     ]
#   }
# }