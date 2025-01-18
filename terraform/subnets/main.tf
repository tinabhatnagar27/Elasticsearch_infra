# public subnet
resource "aws_subnet" "pub-sub1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub-cidr
  availability_zone       = var.pub-sub1-az

  tags = {
    Name = "public-subnet"
  }
}

# private subnet
resource "aws_subnet" "pri-sub-1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pri-sub-1-cidr
  availability_zone       = var.pri-sub1-az

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "pri-sub-2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pri-sub-2-cidr
  availability_zone       = var.pri-sub2-az

  tags = {
    Name = "private-subnet-2"
  }
}

# Elastic IP
resource "aws_eip" "nat" {
  domain = "vpc"
}

# Nat gatway
resource "aws_nat_gateway" "Nat-gate" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.pub-sub1.id

  tags = {
    Name = "Nat-gate"
  }
}
