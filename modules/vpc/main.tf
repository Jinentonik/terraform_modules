resource "aws_vpc" "vpc1" {
    cidr_block = var.vpc1_cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "vpc1"
    }
}

resource "aws_vpc" "vpc2" {
    cidr_block = var.vpc1_cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "vpc2"
    }
}

resource "aws_vpc_peering_connection" "vpc1_vpc2_peering" {
    vpc_id = aws_vpc.vpc1.id
    peer_vpc_id = aws_vpc.vpc2.id
    auto_accept = true
    tags = {
        Name = "vpc1_vpc2_peering"
    }
}

resource "aws_internet_gateway" "my_vpc2_igw" {
  vpc_id = aws_vpc.vpc2.id
  tags = {
    Name = "VPC2 Internet Gateway"
  }
}



