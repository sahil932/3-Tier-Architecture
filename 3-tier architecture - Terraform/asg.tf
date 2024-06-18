module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name                      = "${var.owner}-asg"
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  wait_for_capacity_timeout = 0
  health_check_type         = var.health_check_type
  vpc_zone_identifier       = module.vpc.private_subnets

  # Launch template
  launch_template_name   = var.launch_template_name
  update_default_version = true
  network_interfaces = [
    {
      associate_public_ip_address = var.associate_public_ip_address
    }
  ]
  image_id          = data.aws_ami.ami_id.id
  instance_type     = var.instance_type
  ebs_optimized     = false
  user_data         = base64encode(templatefile("user-data.sh", { rds_endpoint = local.rds_endpoint }))
  target_group_arns = ("${module.alb.target_group_arns}")
  security_groups   = [module.app_sg.security_group_id]

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 8
        volume_type           = "gp2"
      }
    }
  ]
}

locals {
  rds_endpoint = module.db.db_instance_endpoint
}

