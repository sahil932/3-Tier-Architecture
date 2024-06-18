module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "${var.owner}-alb"

  load_balancer_type = var.lb-type

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [module.alb_sg.security_group_id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = var.lb-protocol
      backend_port     = var.lb-port
      target_type      = var.tg-type
      stickiness       = { "enabled" = var.stickiness-enabled, "type" = var.stickiness-type }
    }
  ]

  http_tcp_listeners = [
    {
      port               = var.lb-port
      protocol           = var.lb-protocol
      target_group_index = 0
    }
  ]
}