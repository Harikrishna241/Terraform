##creating VPC for the main Project 
#first resource for 
resource "aws_vpc" "main" {
  cidr_block       = var.VPC_cidr_block
  instance_tenancy = "default"
  enable_dns_support = var.Dns_enable

  tags = merge(var.common_tags,
    {
        Name = "expense-dev"
    }
  )
}

## creating internet gateway

resource "aws_internet_gateway" "expense" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags,{
    Name = " expense-dev"
  })
}

 #Public subnet creation 
 resource "aws_subnet" "Public_subnet" {
    count = length(var.public_subnet_cidr_Blocks)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr_Blocks[count.index]
    availability_zone = local.available_zone[count.index]

  tags = merge(var.common_tags,{
    Name = " expense-dev-public-subnet-${local.available_zone[count.index]}"
  })
}

 resource "aws_subnet" "private_subnet" {
    count = length(var.private_subnet_cidr_Blocks)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr_Blocks[count.index]
    availability_zone = local.available_zone[count.index]

  tags = merge(var.common_tags,{
    Name = " expense-dev-private-subnet-${local.available_zone[count.index]}"
  })
}

 resource "aws_subnet" "db_subnet" {
    count = length(var.db_subnet_cidr_Blocks)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.db_subnet_cidr_Blocks[count.index]
    availability_zone = local.available_zone[count.index]

  tags = merge(var.common_tags,{
    Name = " expense-dev-db-subnet-${local.available_zone[count.index]}"
  })
}


# creation of elastic ips "Static IP"
resource "aws_eip" "expense_eip" {
    domain   = "vpc"
}

#Creation of nat_gateway_id
resource "aws_nat_gateway" "example" {
    allocation_id = aws_eip.expense_eip.id
    subnet_id     = aws_subnet.Public_subnet[0].id

    tags = {
        Name = "expense NAT"
    }

    # To ensure proper ordering, it is recommended to add an explicit dependency
    # on the Internet Gateway for the VPC.
    depends_on = [aws_internet_gateway.expense]
}


#creation of route table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public_route"
  }
}

resource "aws_route_table" "privte_route" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private_route"
  }
}

resource "aws_route_table" "db_route" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "db_route"
  }
}

###creation routes

#1) public routes 
resource "aws_route" "public_route" {
    route_table_id            = aws_route_table.public_route.id
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.expense.id  
        
}
#2) private route table
resource "aws_route" "private_route" {
    route_table_id            = aws_route_table.privte_route.id
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id    
        
}

resource "aws_route" "db_route" {
    route_table_id            = aws_route_table.db_route.id
    destination_cidr_block    = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id    
        
}


# route table association
resource "aws_route_table_association" "public_association" {
    count = length(var.public_subnet_cidr_Blocks)
    subnet_id      = element(aws_subnet.Public_subnet[*].id,count.index)
    route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "private_association" {
    count = length(var.private_subnet_cidr_Blocks)
    subnet_id      = element(aws_subnet.private_subnet[*].id,count.index)
    route_table_id = aws_route_table.public_route.id
}


resource "aws_route_table_association" "db_association" {
    count = length(var.db_subnet_cidr_Blocks)
    subnet_id      = element(aws_subnet.db_subnet[*].id,count.index)
    route_table_id = aws_route_table.db_route.id
}