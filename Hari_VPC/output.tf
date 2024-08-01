output "zone_value" {
    value = slice(data.aws_availability_zones.az.names,0,2)
  
}