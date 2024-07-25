resource "aws_instance" "Prod" {
    count = length(var.tag_names)
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.sg.id]
    tags = {
      Name = var.tag_names[count.index]
      Environment = "Dev"
    }
}

resource "aws_security_group" "sg" { 
    name = var.sg_name
    tags={
        name=var.sg_name
        createdby=var.createdby
    }
    ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
    }
    egress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
    }
}