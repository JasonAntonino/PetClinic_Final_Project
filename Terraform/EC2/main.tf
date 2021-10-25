resource "aws_instance" "foo" {
  ami               = var.ami 
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.availability_zone
  user_data = "${file("DockerInstall.sh")}"

  network_interface {
    network_interface_id = aws_network_interface.prod.id
    device_index         = 0
  }
}

resource "aws_network_interface" "prod" {
  subnet_id       = var.subnet_id
  private_ips     = [var.instance_private_ip]
  security_groups = [var.security_group]
}

# resource "aws_db_instance" "rds" {
#   allocated_storage      = 10 # Gb
#   engine                 = "mysql"
#   engine_version         = "5.7"
#   instance_class         = var.db_instance_class 
#   name                   = var.initial_db_name
#   username               = "root"
#   password               = var.db_password
#   parameter_group_name   = "default.mysql5.7"
#   skip_final_snapshot    = true
#   db_subnet_group_name   = var.subnet_group_name
#   vpc_security_group_ids = [var.private_security_group]
# }

resource "aws_instance" "jenkins" {
  ami               = var.ami_id 
  instance_type     = var.instance_type 
  availability_zone = var.av_zone 
  key_name          = var.key_name
  user_data = "${file("JenkinsInstall.sh")}"

  network_interface {
    device_index         = 0
    network_interface_id = var.net_id_jenk
  }

  tags = {
    Name = "jenkins"
  }
}

resource "aws_instance" "worker" {
  ami               = var.ami_id 
  instance_type     = var.instance_type 
  availability_zone = var.av_zone 
  key_name          = var.key_name
  user_data = "${file("DockerInstall.sh")}"

  network_interface {
    device_index         = 0
    network_interface_id = var.net_id_worker
  }

  tags = {
    Name = "worker"
  }
}