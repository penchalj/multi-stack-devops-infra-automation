module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnets[0]
  private_subnet_id = module.vpc.private_subnets[0]

  frontend_sg_id = module.sg.frontend_sg_id
  backend_sg_id  = module.sg.backend_sg_id
  db_sg_id       = module.sg.db_sg_id

  key_name      = var.key_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
}

# Optional later: module "alb" { ... }

resource "aws_key_pair" "voting_key" {
  key_name   = "voting-app-key"
  public_key = file("~/.ssh/voting-app-key.pub")
}

