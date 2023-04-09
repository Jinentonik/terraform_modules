resource "aws_subnet" "vpc1_PrivateSubnet1" {
    vpc_id            = var.vpc1_id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "vpc1_PrivateSubnet1"
    }
    # route_table_id          = aws_route_table.vpc1_route_table.id
    # depends_on = [
    #     aws_route_table.vpc2_route_table
    # ]
    map_public_ip_on_launch = false
}

resource "aws_subnet" "vpc1_PrivateSubnet2" {
    vpc_id            = var.vpc1_id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "vpc1_PrivateSubnet2"
    }
    # route_table_id          = aws_route_table.vpc1_route_table.id
    # depends_on = [
    #     aws_route_table.vpc2_route_table
    # ]
    map_public_ip_on_launch = false
}

resource "aws_subnet" "vpc2_PrivateSubnet1" {
    vpc_id            = var.vpc2_id
    cidr_block        = "173.0.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "vpc2_PrivateSubnet1"
    }

    map_public_ip_on_launch = false
    # route_table_id          = aws_route_table.vpc1_route_table.id
    # depends_on = [
    #     aws_route_table.vpc2_route_table
    # ]
}

resource "aws_subnet" "vpc2_PublicSubnet1" {
    vpc_id            = var.vpc2_id
    cidr_block        = "173.0.2.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "vpc2_PublicSubnet1"
    }

    map_public_ip_on_launch = true
}
