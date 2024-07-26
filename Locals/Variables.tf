#ec2 varibles
variable "ami_id" {
    type = string
    description = "keeping image id"
    default = "ami-041e2ea9402c46c32"
  
}

variable "instance_type" {
    type = string
    description = "cpu configuration"
    default = "t2.micro"
  
}

variable "instance_names" {
  description = "Create ec2 instances with these names"
  type        = list(string)
  default     = ["frontend", "backend", "DB"]
}

variable "tag_names" {
    
  default     = {
    Project = "Expense"
    Environment = "Dev"
    Terraform = true
  }
}

#Securiy group vriables 

variable "sg_name" {
#   description = "Create ec2 instances with these names"
#   type        = list(string)
  default     = "sg"
}

variable "createdby" {
#   description = "Create ec2 instances with these names"
#   type        = list(string)
  default     = "Harikrishna"
}

variable "ssh_port" {
#   description = "Create ec2 instances with these names"
#   type        = list(string)
  default     = 0
}

variable "cidr_blocks" {
#   description = "Create ec2 instances with these names"
#   type        = list(string)
  default     = ["0.0.0.0/0"]
}

#Route53 variables
variable "Route53_zoneid" {
    default     = "Z079338319Z6J4IXS26ZS"
}

variable "domain_name" {
    
    type = string
    default = "hariaws.site"
}


