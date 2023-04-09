resource "aws_route_table" "vpc1_route_table" {
    vpc_id = var.vpc1_id

    tags = {
        Name = "VPC1 Route Table"
    }
}

resource "aws_route_table" "vpc2_route_table" {
    vpc_id = var.vpc2_id

    tags = {
        Name = "VPC2 Route Table"
    }
}

resource "aws_route_table" "vpc2_public_route_table" {
    vpc_id = var.vpc2_id

    tags = {
        Name = "VPC2 Public Route Table"
    }
}


resource "aws_route" "vpc1_to_vpc2" {
    route_table_id = aws_route_table.vpc1_route_table.id
    destination_cidr_block = var.vpc2_cidr_block
    vpc_peering_connection_id = var.vpc1_vpc2_peering_connection_id
}

resource "aws_route" "vpc2_to_vpc1" {
    route_table_id = aws_route_table.vpc2_route_table.id
    destination_cidr_block = var.vpc1_cidr_block
    vpc_peering_connection_id = var.vpc1_vpc2_peering_connection_id
}

resource "aws_route" "vpc2_igw" {
  route_table_id = aws_route_table.vpc2_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.igw_id
}

resource "aws_route_table_association" "vpc2_public_subnet_association" {
  subnet_id = var.vpc2_PublicSubnet1_id
  route_table_id = aws_route_table.vpc2_public_route_table.id
}

resource "aws_route_table_association" "vpc1_private_subnet_association" {
  subnet_id = var.vpc1_PrivateSubnet1_id
  route_table_id = aws_route_table.vpc1_route_table.id
}

resource "aws_route_table_association" "vpc2_private_subnet_association" {
  subnet_id = var.vpc2_PrivateSubnet1_id
  route_table_id = aws_route_table.vpc2_route_table.id
}