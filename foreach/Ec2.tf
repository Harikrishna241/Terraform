resource "aws_instance" "example" {
    for_each = var.instance_names
    ami  = var.ami_info #"ami-04e914639d0cca79a"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = merge(var.tag_info,{
        Name = "${each.key}"
        module = "${each.key}"
        })
  
}
#Creting the securiy group 
resource "aws_security_group" "allow_tls" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic and all outbound traffic"
    tags = {
        Name = "allow_tls"
        createdby = "Hrikrishna"
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = local.cidr_block
    }
    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = local.cidr_block
    }
}

# Trying new ecurity grooup cretion 

# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "allow_tls"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   from_port         = 0
#   ip_protocol       = "tcp"
#   to_port           = 0
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }