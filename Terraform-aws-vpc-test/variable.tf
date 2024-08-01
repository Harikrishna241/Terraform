variable "project_name" {
    default = "expense"
  
}
variable "common_tags" {
    default = {
        Project = "expense"
        Environmeent = "Dev"
        Terraform = "true"
    }
  
}

variable "public_cidr_blocks"{
    type =list
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_backend_cidr_blocks"{
    type =list
    default = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "private_db_cidr_blocks"{
    type =list
    default = ["10.0.5.0/24","10.0.6.0/24"]
}