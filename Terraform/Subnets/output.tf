# Outputs the ID of public subnet 1
output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

# Outputs the ID of private subnet 1
output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}

# Outputs the ID of private subnet 1
output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}

# Outputs the Subnet Group name
output "subnet_group_name" {
  value = aws_db_subnet_group.subnet_group.name
}

# Outputs the Security Group ID
output "jenkins_sg_id" {
  value = aws_security_group.jenkins_sg.id
}

# Outputs the Security Group ID
output "docker_swarm_sg" {
  value = aws_security_group.docker_swarm_sg.id
}

# Outputs the Security Group ID
output "allow_mysql" {
  value = aws_security_group.allow_mysql.id
}

# Outputs the Security Group object
output "jenkins_sg" {
  value = aws_security_group.jenkins_sg
}

# Outputs the Security Group object
output "docker_swarm_sg" {
  value = aws_security_group.docker_swarm_sg
}

# Outputs the Security Group object
output "allow_mysql" {
  value = aws_security_group.allow_mysql
}

# Outputs the CIDR block of public subnet 1
output "public_subnet_1_cidr" {
  value = var.public_subnet_1_cidr
}

# Outputs the CIDR block of private subnet 1
output "private_subnet_1_cidr" {
  value = var.private_subnet_1_cidr
}

# Outputs the CIDR block of private subnet 2
output "private_subnet_2_cidr" {
  value = var.private_subnet_2_cidr
}

output "nat_gateway" {
    value = aws_nat_gateway.nat_gateway
}
