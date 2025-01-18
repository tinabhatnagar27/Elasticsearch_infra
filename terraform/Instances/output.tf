#instenses ID
output "elasticsearch-public-id" {
  value = aws_instance.elasticsearch-public.id
}

output "elasticsearch-private-1-id" {
  value = aws_instance.elasticsearch-private-1.id
}

output "elasticsearch-private-2-id" {
  value = aws_instance.elasticsearch-private-2.id
}

# instences IP addresses
output "elasticsearch-public-ip" {
  value = aws_instance.elasticsearch-public.public_ip
}

output "elasticsearch-private-1-ip" {
  value = aws_instance.elasticsearch-private-1.private_ip
}

output "elasticsearch-private-2-ip" {
  value = aws_instance.elasticsearch-private-2.private_ip
}
