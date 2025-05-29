resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_range
  
  tags = {
    Name = var.vpc_name
  }
}


resource "aws_subnet" "sb1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_2_cidr
  map_public_ip_on_launch = true
  availability_zone = var.subnet_availability_zone
  depends_on = [ aws_vpc.vpc ]

  tags = {
    Name = var.subnet_01_name
  }
}

resource "aws_subnet" "sb2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_1_cidr
  map_public_ip_on_launch = true
  
  availability_zone = var.subnet_availability_zone
  depends_on = [ aws_vpc.vpc ]

  tags = {
    Name = var.subnet_02_name
  }
}


resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.vpc-igw-name
  }
}

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.vpc.id

  route {
    gateway_id = aws_internet_gateway.igw-1.id
    cidr_block = var.igw-route-cidr
  }
}


resource "aws_route_table_association" "igw-associate" {
    subnet_id = aws_subnet.sb1.id
    route_table_id = aws_route_table.name.id
}


