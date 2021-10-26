# Subnet 1 (Public)
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}

# Subnet 2 (Private)
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.availability_zone_2
  tags = {
    Name = "private_subnet_1"
  }
}

#Subnet 3 (Private)
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.availability_zone_3
  tags = {
    Name = "private_subnet_2"
  }
}

# Subnet group (contains public_subnet_1 and public_subnet_2)
resource "aws_db_subnet_group" "subnet_group" {
  name       = "rds"
  subnet_ids = [aws_subnet.public_subnet_1.id, aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

# NAT Gateway
# resource "aws_nat_gateway" "nat_gateway" {
#   depends_on = [
#     aws_eip.nat_gateway_eip
#   ]

#   allocation_id = aws_eip.nat_gateway_eip.id
#   subnet_id = aws_subnet.public_subnet_1.id

#   tags = {
#     Name = "Nat-Gateway_DB"
#   }
# }

# #Nat Gateway EIP
# resource "aws_eip" "nat_gateway_eip" {
#   vpc                       = true
#   depends_on                = [var.internet_gateway]
# }



# Security Group - Jenkins
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Security Group for Jenkins Instance"
  vpc_id      = var.vpc_id

  # SSH Access
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # SSH Access
  ingress {
    description      = "Connect to Jenkins UI"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  # Allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Main"
  }
}

# Security Group - Docker Swarm Instance
resource "aws_security_group" "docker_swarm_sg" {
  name        = "docker_swarm_sg"
  description = "Security Group for the Docker Swarm Nodes"
  vpc_id      = var.vpc_id

  # SSH Access
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Application"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Application"
    from_port        = 9966
    to_port          = 9966
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "TCP Communication between nodes"
    from_port        = 7946
    to_port          = 7946
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "UDP Communication between nodes"
    from_port        = 7946
    to_port          = 7946
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Overlay network traffic"
    from_port        = 4789
    to_port          = 4789
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Cluster management communications"
    from_port        = 2377
    to_port          = 2377
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  # Allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Main"
  }
}


# Security Group - Allows MYSQL traffic
resource "aws_security_group" "allow_mysql" {
  name        = "allow_mysql"
  description = "Allow mysql inbound traffic"
  vpc_id      = var.vpc_id

  # SQL Traffic
  ingress {
    description      = "MYSQL access"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  # Allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Main"
  }
}


# Route Table Association
resource "aws_route_table_association" "RTA_public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "RTA_private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "RTA_private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = var.private_route_table_id
}