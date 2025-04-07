terraform {
  backend "s3" {
    bucket         = "samuellincoln-iac-project-state"
    key            = "tf-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "iac-project-state-locking"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source                      = "./modules/vpc"
  cidr_block                  = "10.0.0.0/16"
  enable_dns_hostnames        = true
  enable_dns_support          = true
  public_subnet_cidr_block_1  = "10.0.1.0/24"
  public_subnet_cidr_block_2  = "10.0.2.0/24"
  map_public_ip_on_launch     = true
  availability_zone_1         = "us-east-1a"
  availability_zone_2         = "us-east-1b"
  private_subnet_cidr_block_1 = "10.0.3.0/24"
  private_subnet_cidr_block_2 = "10.0.4.0/24"
  private_subnet_cidr_block_3 = "10.0.5.0/24"
}

module "alb" {
  source                                            = "./modules/alb"
  vpc_id                                            = module.vpc.vpc_id
  public_subnet_id                                  = module.vpc.public_subnet_id_1
  public_subnet_id_2                                = module.vpc.public_subnet_id_2
  alb_name                                          = "iac-project-alb"
  alb_target_group_name                             = "iac-project-alb-target-group"
  alb_target_group_port                             = 8080
  alb_target_group_protocol                         = "HTTP"
  alb_target_group_health_check_path                = "/"
  alb_target_group_health_check_interval            = 30
  alb_target_group_health_check_timeout             = 10
  alb_target_group_health_check_healthy_threshold   = 2
  alb_target_group_health_check_unhealthy_threshold = 2
  alb_target_group_health_check_matcher             = "200-399"
  ec2_cidr_blocks                                   = [module.vpc.private_subnet_cidr_block_3]
}


module "rds" {
  source                 = "./modules/rds"
  engine                 = "mysql"
  engine_version         = "8.4.4"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  port                   = 3306
  rds_security_group_ids = [module.asg.rds-security-group-id]
  skip_final_snapshot    = true
  private_subnet_ids     = [module.vpc.private_subnet_id_1, module.vpc.private_subnet_id_2, module.vpc.private_subnet_id_3]
  db_username            = var.db_username
  db_password            = var.db_password
}

module "asg" {
  source                 = "./modules/asg"
  vpc_id                 = module.vpc.vpc_id
  launch_template_name   = "web-server-launch-template"
  image_id               = "ami-011899242bb902164"
  instance_type          = "t2.micro"
  key_name               = "aws-server"
  autoscaling_group_name = "web-server-autoscaling-group"
  max_size               = 4
  min_size               = 2
  desired_capacity       = 2
  vpc_zone_identifier    = [module.vpc.private_subnet_id_1, module.vpc.private_subnet_id_2]
  target_group_arn       = module.alb.target_group_arn
  alb_security_group_id  = module.alb.security_group_id
  rds_cidr_block         = "10.0.0.0/16"
}





