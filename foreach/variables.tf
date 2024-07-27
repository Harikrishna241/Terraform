variable "ami_info" {
  type = string
  description = "this is the customize OS RHEL"
  default = "ami-041e2ea9402c46c32"
}

variable "tag_info" {
  type = map
  description = "this is the customize OS RHEL"
  default = {
    Project = "Expense"
    Environment = "Dev"
  }
}

variable "instance_names" {
    type = map
    description = "this is for the for each loop based "
    default = {
        DB="t2.micro"
        Backend = "t2.micro"
        Frontend = "t3.micro"
    }
}

##Security group varaibles 

variable "from_port" {
    type = number
    default = 0
  
}

variable "to_port" {
    type = number
    default = 0
  
}

# variable "cidr_block" {
#     type = list
#     default = ["0.0.0.0/0"]
  
# }

variable "protocol" {
    type = string
    default = "-1"
  
}


##route53 variables
variable "zone_id_ino" {
    type = string
    default = "Z079338319Z6J4IXS26ZS"
  
}