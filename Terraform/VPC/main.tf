resource "aws_vpc" "our_vpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.our_vpc.id

  tags = {
    Name = "terraform_gw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.our_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
    }

  route {
      ipv6_cidr_block        = "::/0"
      gateway_id = aws_internet_gateway.gw.id
    }

  tags = {
    Name = "terraform_public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.our_vpc.id
  # depends_on = [
  #   var.nat_gate
  # ]

  route = []
  # route {
  #     cidr_block = "0.0.0.0/0"
  #     nat_gateway_id = var.nat_gate.id
  # }

  tags = {
    Name = "terraform_private"
  }
}

locals {
  cluster_name = "project-eks"
}

