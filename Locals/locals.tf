locals {
   # route_name=var.instance_names[count.index]== "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
   # route_records = var.instance_names[count.index]== "frontend" ? [aws_instance.Expense[count.index].public_ip] : [aws_instance.Expense[count.index].private_ip]

    instance_type = var.instance_type
}