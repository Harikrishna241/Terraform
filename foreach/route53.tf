 resource "aws_route53_record" "expensive_route" {
    for_each = aws_instance.example
    zone_id = var.zone_id_ino 
    name    = each.key == "Frontend" ? "hariaws.site":"hariaws.ite-${each.key}"
    type    = "A"
    ttl     = 1
    records = each.key=="Frontend"? [each.value.public_ip]:[each.value.private_ip]

}