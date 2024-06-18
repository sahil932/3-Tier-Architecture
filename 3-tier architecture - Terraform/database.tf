module "db" {
  source = "terraform-aws-modules/rds/aws"

  engine         = var.db-engine
  engine_version = var.db-engine_version

  instance_class         = var.db-instance_class
  allocated_storage      = var.db-storage
  identifier             = var.db-identifier
  db_name                = "${var.owner}db"
  username               = var.username
  password               = var.password
  create_random_password = false

  port                 = var.db-port
  family               = var.db-family
  major_engine_version = var.db-engine_version

  iam_database_authentication_enabled = false

  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets
  vpc_security_group_ids = [module.db_sg.security_group_id]

  deletion_protection = false
  skip_final_snapshot = true
}

