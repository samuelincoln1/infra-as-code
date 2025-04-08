resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    Name = "iac-project-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "iac-project-igw"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block_1
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone_1
  tags = {
    Name = "iac-project-public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block_2
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone_2
  tags = {
    Name = "iac-project-public-subnet-2"
  }
}


resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_block_1
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zone_1
  tags = {
    Name = "iac-project-private-subnet-1"
  }
}
resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_block_2
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zone_2
  tags = {
    Name = "iac-project-private-subnet-2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr_block_3
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zone_2
  tags = {
    Name = "iac-project-private-subnet-3"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "iac-project-public-route-table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "iac-project-private-route-table"
  }
}

resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}


resource "aws_route_table_association" "private-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association-3" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private-route-table.id
}








