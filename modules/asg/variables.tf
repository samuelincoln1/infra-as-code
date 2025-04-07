variable "launch_template_name" {
  type        = string
  description = "The name of the launch template"
}

variable "image_id" {
  type        = string
  description = "The ID of the AMI to use for the instances"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to use for the instances"
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for the instances"
}

variable "autoscaling_group_name" {
  type        = string
  description = "The name of the autoscaling group"
}

variable "max_size" {
  type        = number
  description = "The maximum number of instances in the autoscaling group"
}

variable "min_size" {
  type        = number
  description = "The minimum number of instances in the autoscaling group"
}

variable "desired_capacity" {
  type        = number
  description = "The desired number of instances in the autoscaling group"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "The IDs of the subnets to use for the instances"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to use for the instances"
}

variable "alb_security_group_id" {
  type        = string
  description = "The ID of the ALB security group"
}

variable "rds_cidr_block" {
  type        = string
  description = "The CIDR block of the RDS"
}

variable "target_group_arn" {
  type        = string
  description = "The ARN of the ALB target group"
}
