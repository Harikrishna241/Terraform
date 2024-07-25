#for ec2 instance main requirments are 
# Security group 
# AMI
#Instanc type 
resource "aws_instance" "Prod" {
    ami = "ami-041e2ea9402c46c32"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sg.id]
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