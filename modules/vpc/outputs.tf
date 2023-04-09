output "vpc1_id" {
    value = aws_vpc.vpc1.id
}
output "vpc2_id" {
    value = aws_vpc.vpc2.id
}
output "vpc1_cidr_block" {
    value = aws_vpc.vpc1.cidr_block
}
output "vpc2_cidr_block" {
    value = aws_vpc.vpc2.cidr_block
}
output "vpc1_vpc2_peering_connection_id" {
    value = aws_vpc_peering_connection.vpc1_vpc2_peering.id
}
output "igw_id" {
    value = aws_internet_gateway.my_vpc2_igw.id
}