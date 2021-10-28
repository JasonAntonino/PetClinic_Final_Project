# resource "aws_instance" "foo" {
#   ami               = var.swarm_ami 
#   instance_type     = var.swarm_instance_type
#   key_name          = var.swarm_key_name_1
#   availability_zone = var.availability_zone
#   user_data = "${file("./EC2/DockerInstall.sh")}"

#   network_interface {
#     network_interface_id = aws_network_interface.foo_NI.id
#     device_index         = 0
#   }
# }

# resource "aws_network_interface" "foo_NI" {
#   subnet_id       = var.public_subnet_id
#   private_ips     = [var.foo_private_ip]
#   security_groups = [var.swarm_security_group]
# }


# resource "aws_instance" "worker" {
#   ami               = var.swarm_ami
#   instance_type     = var.swarm_instance_type 
#   availability_zone = var.availability_zone 
#   key_name          = var.swarm_key_name_2
#   user_data = "${file("./EC2/DockerInstall.sh")}"

#   network_interface {
#     device_index         = 0
#     network_interface_id = aws_network_interface.worker_NI.id
#   }

#   tags = {
#     Name = "worker"
#   }
# }

# resource "aws_network_interface" "worker_NI" {
#   subnet_id       = var.public_subnet_id
#   private_ips     = [var.worker_private_ip]
#   security_groups = [var.swarm_security_group]
# }


resource "aws_instance" "jenkins" {
  ami               = var.jenkins_ami
  instance_type     = var.jenkins_instance_type 
  availability_zone = var.availability_zone 
  key_name          = var.jenkins_key_name
  user_data = "${file("./EC2/JenkinsInstall.sh")}"

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.jenkins_NI.id
  }

  tags = {
    Name = "jenkins"
  }
}

resource "aws_network_interface" "jenkins_NI" {
  subnet_id       = var.public_subnet_id
  private_ips     = [var.jenkins_private_ip]
  security_groups = [var.jenkins_security_group]
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