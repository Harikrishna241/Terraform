variable "ami_id" {
    type = string
    description = "keeping image id"
    default = "ami-041e2ea9402c46c32"
  
}

variable "insnce_cpu" {
    type = list
    description = "cpu configuration"
    default = ["frontend", "backend", "DB"]
  
}

variable "tag_names" {
  description = "Create ec2 instances with these names"
  #type        = map
  default     = {
    Name ="Own project"
    Project="devOps"
    Environment="Dev"
    Course="Terraform"
  }
}

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