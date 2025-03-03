# resource "aws_security_group" "web_sg" {
#   vpc_id = aws_vpc.nginx_vpc.id
#   name   = "web_sg"
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_http" {
#   security_group_id = aws_security_group.web_sg.id
#   cidr_ipv4         = local.anywhere
#   from_port         = local.http
#   to_port           = local.http
#   ip_protocol       = local.tcp_protocol
# }

# # resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
# #   security_group_id = aws_security_group.web_sg.id
# #   cidr_ipv4         = local.anywhere
# #   from_port         = local.ssh
# #   to_port           = local.ssh
# #   ip_protocol       = local.tcp_protocol
# # }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
#   security_group_id = aws_security_group.web_sg.id
#   cidr_ipv4         = local.anywhere
#   ip_protocol       = local.all_ports
# }