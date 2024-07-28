
#Creting the securiy group 
resource "aws_security_group" "allow_tls" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic and all outbound traffic"
    tags = {
        Name = "allow_tls"
        createdby = "Hrikrishna"
    }
    dynamic "ingress" {
        for_each = var.inbound
        content {
            to_port= ingress.value["to_port"]
            from_port = ingress.value["from_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }
}
    