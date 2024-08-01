resource "aws_instance" "Expense" {
    ami = "ami-041e2ea9402c46c32"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-0b9862f17cf5ec5fe"]

    tags = local.tag_names

    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    
    }
        provisioner "file" {
        source      = "linux.sh"
        destination = "/tmp/script.sh"
    }

    provisioner "remote-exec" {
        inline = [
        "chmod +x /tmp/script.sh",
        "/tmp/script.sh args",
        ]
    }
}