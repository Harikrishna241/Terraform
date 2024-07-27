terraform {
  required_providers {
    aws={
        source = "hashicorp/ws"
        version = "5.59.0"
    }
  }
}

provider "aws" {

    region = "us-east-1"
  
}