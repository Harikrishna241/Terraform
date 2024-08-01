module "vpc_test" {
    source = "../terraform-aws-vpc"
    project_name = var.project_name
    common_tags = var.common_tags
    public_cidr_blocks = var.public_cidr_blocks
    private_backend_cidr_blocks = var.private_backend_cidr_blocks
    private_db_cidr_blocks = var.private_db_cidr_blocks
}