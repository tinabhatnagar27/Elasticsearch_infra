#instenses ID
output "pub-instance-id" {
  value = aws_instance.es-public.id
}

output "private-instance1-id" {
  value = aws_instance.es-private-1.id
}

output "private-instance2-id" {
  value = aws_instance.es-private-2
}

# instences IP addresses
output "public-instance-ip" {
  value = aws_instance.es-public.public_ip
}

output "private-instance1-ip" {
  value = aws_instance.es-private-1.private_ip
}

output "private-instance2-ip" {
  value = aws_instance.es-private-2.private_ip
}
