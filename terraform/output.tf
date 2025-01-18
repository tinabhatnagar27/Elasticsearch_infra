output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public-subnet1-id" {
  value = module.subnet.pub-sub-id
}

output "private-subnet1-id" {
  value = module.subnet.pri-sub-1-id
}

output "private-subnet2-id" {
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
  value = module.instance.elasticsearch-private-1-id
}

output "elasticsearch-private-2-id" {
  value = module.instance.elasticsearch-private-2-id
}

output "public-instance-id" {
  value = module.instance.public-instance-ip
}

# Instance IP Address
output "private-instance1-ip" {
  value = module.instance.private-instance1-ip
}

output "private-instance2-ip" {
  value = module.instance.private-instance2-ip
}

output "public-instance1-ip" {
  value = module.instance.public-instance-ip
}
