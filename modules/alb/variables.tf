variable "alb_name" {
  type        = string
  description = "The name of the ALB"
}

variable "public_subnet_id" {
  type        = string
  description = "The ID of the public subnet"
}

variable "public_subnet_id_2" {
  type        = string
  description = "The ID of the public subnet"
}

variable "alb_target_group_name" {
  type        = string
  description = "The name of the ALB target group"
}

variable "alb_target_group_port" {
  type        = number
  description = "The port of the ALB target group"
}

variable "alb_target_group_protocol" {
  type        = string
  description = "The protocol of the ALB target group"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "alb_target_group_health_check_path" {
  type        = string
  description = "The path of the ALB target group health check"
}

variable "alb_target_group_health_check_interval" {
  type        = number
  description = "The interval of the ALB target group health check"
}

variable "alb_target_group_health_check_timeout" {
  type        = number
  description = "The timeout of the ALB target group health check"
}

variable "alb_target_group_health_check_healthy_threshold" {
  type        = number
  description = "The healthy threshold of the ALB target group health check"
}

variable "alb_target_group_health_check_unhealthy_threshold" {
  type        = number
  description = "The unhealthy threshold of the ALB target group health check"
}

variable "alb_target_group_health_check_matcher" {
  type        = string
  description = "The matcher of the ALB target group health check"
}

variable "ec2_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks of the EC2 instances"
}
