# Swarm Variables
variable "swarm_ami" {}
variable "swarm_instance_type" {}
variable "availability_zone" {}
variable "public_subnet_id" {}
variable "swarm_security_group" {}


# Foo Instance Variables
variable "swarm_key_name_1" {}
variable "foo_private_ip" {}


# Worker Instance Variables
variable "swarm_key_name_2" {}
variable "worker_private_ip" {}


# Jenkins Instance Variables
variable "jenkins_instance_type" {}
variable "jenkins_ami" {}
variable "jenkins_key_name" {}
variable "jenkins_private_ip" {}
variable "jenkins_security_group" {}

# variable "db_password" {}
# variable "subnet_group_name" {}
# variable "private_security_group" {}
# variable "db_instance_class" {}
# variable "initial_db_name" {}