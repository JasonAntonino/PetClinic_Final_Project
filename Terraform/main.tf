provider "aws" {
  region = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "VPC" {
  source = "./VPC"

  vpc_cidr = "10.0.0.0/16"
  nat_gate = module.Subnets.nat_gate
}

module "EC2" {
  source = "./EC2"

  instance_type          = "t2.micro"
  ami                    = "ami-0194c3e07668a7e36"
  key_name               = ""
  availability_zone      = "eu-west-1a"
  subnet_id              = module.Subnets.subnet_id
  security_group         = module.Subnets.security_group
  instance_private_ip    = format("%s%s", substr(module.Subnets.subnet_cidr, 0, 7), "50") 
#   db_password            = var.db_password
#   private_security_group = module.Subnets.private_security_group
#   subnet_group_name      = module.Subnets.subnet_group_name
#   db_instance_class      = "db.t3.micro"
#   initial_db_name        = "gameWorkshop"
}
