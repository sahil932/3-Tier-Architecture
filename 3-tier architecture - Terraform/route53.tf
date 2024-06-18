# resource "aws_route53_record" "alb_record" {
#   zone_id = "*"
#   name    = "nandan-alb"
#   type    = "CNAME"
#   ttl     = 300
#   records = [module.alb.lb_dns_name]
# }

# resource "aws_route53_record" "rds_record" {
#   zone_id = "*"
#   name    = "nandan-rds"
#   type    = "CNAME"
#   ttl     = 300
#   records = [module.db.db_instance_address]
# }

# resource "aws_route53_zone_association" "records_private" {
#   zone_id = "*"
#   vpc_id  = module.vpc.vpc_id
# }