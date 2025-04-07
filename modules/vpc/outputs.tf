output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_id_1" {
  value = aws_subnet.private-subnet-1.id
}

output "private_subnet_id_2" {
  value = aws_subnet.private-subnet-2.id
}

output "private_subnet_id_3" {
  value = aws_subnet.private-subnet-3.id
}

output "public_subnet_id_1" {
  value = aws_subnet.public-subnet-1.id
}

output "public_subnet_id_2" {
  value = aws_subnet.public-subnet-2.id
}

output "private_subnet_cidr_block_1" {
  value = aws_subnet.private-subnet-1.cidr_block
}

output "private_subnet_cidr_block_2" {
  value = aws_subnet.private-subnet-2.cidr_block
}

output "private_subnet_cidr_block_3" {
  value = aws_subnet.private-subnet-3.cidr_block
}
