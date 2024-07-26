resource "aws_route53_record" "Expense" {
    count = length(var.instance_names)
    zone_id = var.Route53_zoneid
    name    = var.instance_names[count.index]== "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = var.instance_names[count.index]== "frontend" ? [aws_instance.Expense[count.index].public_ip] : [aws_instance.Expense[count.index].private_ip]
}
