variable "public_subnet_cidr_Blocks" {
    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnet_cidr_Blocks" {
    type = list
    default = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "db_subnet_cidr_Blocks" {
    type = list
    default = ["10.0.5.0/24","10.0.6.0/24"]
}