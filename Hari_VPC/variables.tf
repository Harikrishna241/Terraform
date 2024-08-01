####VPC variables###

variable "common_tags" {
    type = map
    default = {
        Project = "expense"

    }
  
}
variable "Dns_enable" {

    type = bool
    default = "true"  
}
variable "environment" {

    type = string
    default = "dev"  
}

variable "VPC_cidr_block" {
    type = string
    default = "10.0.0.0/16"
  
}

###Subnet variables
variable "public_subnet_cidr_Blocks" {
    type = list
    validation {
        condition = length(var.public_subnet_cidr_Blocks) == 2
        error_message = "pleasee prvide two inputs"
    }
}

variable "public_subnet_tags" {
    type = map
    default = {}
}

variable "private_subnet_cidr_Blocks" {
    type = list
    validation {
        condition = length(var.private_subnet_cidr_Blocks) == 2
        error_message = "pleasee prvide two inputs"
    }
  
}

variable "private_subnet_tags" {
    type = map
    default = {}
}

variable "db_subnet_cidr_Blocks" {
    type = list
    validation {
        condition = length(var.db_subnet_cidr_Blocks) == 2
        error_message = "pleasee prvide two inputs"
    }
  
}

variable "db_subnet_tags" {
    type = map
    default = {}
}
