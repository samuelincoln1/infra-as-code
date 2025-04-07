variable "engine" {
  type        = string
  description = "The engine for the RDS instance"
}

variable "engine_version" {
  type        = string
  description = "The engine version for the RDS instance"
}

variable "instance_class" {
  type        = string
  description = "The instance class for the RDS instance"
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage for the RDS instance"
}

variable "db_username" {
  type        = string
  description = "The username for the RDS instance"
}

variable "db_password" {
  type        = string
  description = "The password for the RDS instance"
}

variable "port" {
  type        = number
  description = "The port for the RDS instance"
}

variable "rds_security_group_ids" {
  type        = list(string)
  description = "The list of RDS security group IDs"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Whether to skip the final snapshot"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The list of private subnet IDs"
}

