# Public EC2 Instance
resource "aws_Instance" "elasticsearch-public" {
  ami           = var.ami-id
  Instance_type = var.Instance-type
  subnet_id     = var.pub-sub-id
  associate_public_ip_address = "true"
  security_groups = [var.public-sg-id]
  key_name = var.key-name
  provisioner "file" {
    source      = "/var/lib/jenkins/hello_tool.pem"  
    destination = "/home/ubuntu/hello_tool.pem" 
    connection {
      type        = "ssh"
      user        = "ubuntu"  
      private_key = file("/var/lib/jenkins/hello_tool.pem")  
      host        = self.public_ip  
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ubuntu/hello_tool.pem",  
      "echo 'File copied successfully!'"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"  
      private_key = file("/var/lib/jenkins/hello_tool.pem")  
      host        = self.public_ip  
    }
  }
  tags = {
    Name = "elasticsearch-public"
  }
}

# Private EC2 1 Instance
resource "aws_instance" "elasticsearch-private-1" {
  ami           = var.ami-id
  Instance_type = var.Instance-type
  subnet_id     = var.pri-sub-1-id
  associate_public_ip_address = "false"
  security_groups = [var.private-sg-id]
  key_name = var.key-name

  tags = {
    Name = "elasticsearch-private-1"
  }
}

# Private EC2 2 Instance
resource "aws_instance" "elasticsearch-private-2" {
  ami           = var.ami-id
  Instance_type = var.Instance-type
  subnet_id     = var.pri-sub-2-id
  associate_public_ip_address = "false"
  security_groups = [var.private-sg-id]  
   key_name = var.key-name

  tags = {
    Name = "elasticsearch-private-2"
  }
}
