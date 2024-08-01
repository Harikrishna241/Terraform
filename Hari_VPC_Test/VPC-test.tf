module "vpc_test" {
    source = "../Hari_VPC"
    public_subnet_cidr_Blocks = var.public_subnet_cidr_Blocks
    private_subnet_cidr_Blocks = var.private_subnet_cidr_Blocks
    db_subnet_cidr_Blocks = var.db_subnet_cidr_Blocks
}