locals {
  available_zone = slice(data.aws_availability_zones.az.names,0,2)
}