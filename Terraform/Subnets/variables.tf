# VPC ID
variable "vpc_id" {}

# Public Subnet 1 CIDR and Availability Zone
variable "public_subnet_1_cidr" {}
variable "availability_zone_1" {}

# Private Subnet 1 CIDR and Availability Zone
variable "public_subnet_2_cidr" {}
variable "availability_zone_2" {}

# Private Subnet 2 CIDR and Availability Zone
variable "private_subnet_2_cidr" {}
variable "availability_zone_3" {}


# Route Table ID - Used for route table association
variable "public_route_table_id" {}     # Public
variable "private_route_table_id" {}    # Private

# Internet Gateway
variable "internet_gateway" {}
