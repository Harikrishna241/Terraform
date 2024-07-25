#for ec2 instance main requirments are 
# Security group 
# AMI
#Instanc type 
resource "aws_instance" "Prod" {
    for_each = toset(var.insnce_cpu)
    ami = var.ami_id
    instance_type = ((each.value) == "frontend") ? "t2.micro" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.sg.id]
    tags = merge((var.tag_names),({Name=(each.value)}))
}

resource "aws_security_group" "sg" { 
    name = "Sg"
    tags={
        name="sg"
        createdby="Hari krishna"
    }
    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}