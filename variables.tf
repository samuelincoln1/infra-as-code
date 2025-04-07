variable "db_username" {
  type        = string
  description = "The username for the RDS instance"
}

variable "db_password" {
  type        = string
  description = "The password for the RDS instance"
  sensitive   = true
}

