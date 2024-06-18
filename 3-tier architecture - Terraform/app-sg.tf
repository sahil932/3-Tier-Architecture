module "app_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name   = var.app-sg-name
  vpc_id = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      description              = "http"
      source_security_group_id = module.alb_sg.security_group_id
    },
    {
      from_port                = 443
      to_port                  = 443
      protocol                 = "tcp"
      description              = "https"
      source_security_group_id = module.alb_sg.security_group_id
    },
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
