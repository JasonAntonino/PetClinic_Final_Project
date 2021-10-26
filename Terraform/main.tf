provider "aws" {
  region = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "VPC" {
  source = "./VPC"

  vpc_cidr = "10.0.0.0/16"
  ## Temporarily Commented Nat Gateway
  # nat_gate = module.Subnets.nat_gateway
}

module "EC2" {
  source = "./EC2"

  swarm_ami = "ami-0943382e114f188e8"
  swarm_instance_type = "t2.medium"
  availability_zone      = "eu-west-1a"
  public_subnet_id = module.Subnets.public_subnet_1_id
  swarm_security_group = module.Subnets.docker_swarm_sg_id

  swarm_key_name_1 = "ManagerNode"
  foo_private_ip = "10.0.1.50"

  swarm_key_name_2 = "workerNode"
  worker_private_ip = "10.0.1.60"

  jenkins_ami = "ami-0943382e114f188e8"
  jenkins_instance_type = "t2.medium"
  jenkins_key_name = "JenkinNode"
  jenkins_private_ip = "10.0.1.70"
  jenkins_security_group = module.Subnets.jenkins_sg_id

#   db_password            = var.db_password
#   private_security_group = module.Subnets.private_security_group
#   subnet_group_name      = module.Subnets.subnet_group_name
#   db_instance_class      = "db.t3.micro"
#   initial_db_name        = "gameWorkshop"
}

module "Subnets" {
  source = "./Subnets"

  vpc_id             = module.VPC.vpc_id
  public_subnet_1_cidr = "10.0.1.0/24"
  availability_zone_1  = "eu-west-1a"
  private_subnet_1_cidr = "10.0.2.0/24"
  availability_zone_2  = "eu-west-1b"
  private_subnet_2_cidr = "10.0.3.0/24"
  availability_zone_3  = "eu-west-1c"
  public_route_table_id = module.VPC.route_table_id
  private_route_table_id = module.VPC.pri_route_table_id
  internet_gateway = module.VPC.internet_gate
}
