output "frontend_public_ip" { value = module.ec2.frontend_public_ip }
output "vpc_id"             { value = module.vpc.vpc_id }
output "public_subnets"     { value = module.vpc.public_subnets }