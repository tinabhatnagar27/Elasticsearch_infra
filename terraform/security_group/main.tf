# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Default VPC Security Group
resource "aws_security_group" "default_vpc_sg" {
  vpc_id = data.aws_vpc.default.id
  name   = "default-vpc-sg"
  
  # Allow inbound traffic from the custom VPC
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]   
  }

  # Allow all outbound traffic (optional)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"        
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Public Security Group
resource "aws_security_group" "public-SG" {
  vpc_id = var.vpc_id   

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]   
  }

  # Ingress rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   
  }

  # Ingress rule for HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule for ICMP (ping)
  ingress {
    from_port        = -1               
    to_port          = -1               
    protocol         = "icmp"
    cidr_blocks      = ["172.31.0.0/16", "0.0.0.0/0"]  
     
    ipv6_cidr_blocks = []
  }

  tags = {
    Name = "public-sg"
  }
}

# Private Security Group
resource "aws_security_group" "private-SG" {
  vpc_id = var.vpc_id   

  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  # Ingress rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16", "0.0.0.0/0"]  
  }

  # Ingress rule for ICMP (ping)
  ingress {
    from_port        = -1               
    to_port          = -1                
    protocol         = "icmp"
    cidr_blocks      = ["172.31.0.0/16", "0.0.0.0/0"]  
    ipv6_cidr_blocks = []
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"        
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}
