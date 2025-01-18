output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public-subnet1-id" {
  value = module.subnet.pub-sub1-id
}

output "private-subnet-1-id" {
  value = module.subnet.pri-sub-1-id
}

output "private-subnet-2-id" {
  value = module.subnet.pri-sub-2-id
}

output "public-security-groups" {
  value = module.security_groups.public-sg-id
}

output "private-security-groups" {
  value = module.security_groups.private-sg-id
}

# Instance ID
output "elasticsearch-private-1-id" {
  value = module.Instance.elasticsearch-private-1-id
}

output "elasticsearch-private-2-id" {
  value = module.Instance.elasticsearch-private-2-id
}

output "elasticsearch-public-id" {
  value = module.Instance.elasticsearch-public-id
}

# Instance IP Address
output "elasticsearch-private-1-ip" {
  value = module.Instance.elasticsearch-private-1-ip
}

output "elasticsearch-private-2-ip" {
  value = module.Instance.elasticsearch-private-2-ip
}

output "elasticsearch-public-ip" {
  value = module.Instance.elasticsearch-public-ip
}
