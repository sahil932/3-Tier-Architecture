module "db_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name   = var.db-sg-name
  vpc_id = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 3306
      to_port                  = 3306
      protocol                 = "tcp"
      description              = "mysql"
      source_security_group_id = module.app_sg.security_group_id
    }

  ]

  egress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = "-1"
      description = "outbound"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
