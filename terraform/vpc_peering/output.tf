output "vpc_peering_id" {
    value = aws_vpc_peering_connection.vpc_peering.id
}

output "vpc_id-01" {
  value = data.aws_vpc.default_vpc.id
}

output "default_vpc_cidr" {
  value = data.aws_vpc.default_vpc.cidr_block
}