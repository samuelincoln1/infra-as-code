
resource "aws_db_instance" "iac-project-rds" {
  identifier_prefix      = "iac-project-rds"
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  username               = var.db_username
  password               = var.db_password
  port                   = var.port
  vpc_security_group_ids = var.rds_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.default.name
  skip_final_snapshot    = var.skip_final_snapshot
}

resource "aws_db_subnet_group" "default" {
  name       = "mydb-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}
