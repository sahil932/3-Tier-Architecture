module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.owner}-vpc"
  cidr = var.cidr

  azs = var.azs

  private_subnets      = var.private_cidr
  private_subnet_names = var.private_subnet_names

  public_subnets      = var.public_cidr
  public_subnet_names = var.public_subnet_names

  enable_dns_support   = true
  enable_dns_hostnames = true

  # One NAT per AZ
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  default_route_table_tags = {
    Name = "${var.owner}-vpc-default-rt"
  }
  public_route_table_tags = {
    Name = "${var.owner}-vpc-public-rt"
  }
  private_route_table_tags = {
    Name = "${var.owner}-vpc-private-rt"
  }

  nat_gateway_tags = {
    Name = "${var.owner}-nat"
  }

  igw_tags = {
    Name = "${var.owner}-igw"
  }
}