variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Whether to enable DNS hostnames for the VPC"
}

variable "enable_dns_support" {
  type        = bool
  description = "Whether to enable DNS support for the VPC"
}


variable "public_subnet_cidr_block_1" {
  type        = string
  description = "The CIDR block for the first public subnet"
}

variable "public_subnet_cidr_block_2" {
  type        = string
  description = "The CIDR block for the second public subnet"
}


variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether to map public IP on launch for the public subnet"
}

variable "availability_zone_1" {
  type        = string
  description = "The first availability zone"
}

variable "availability_zone_2" {
  type        = string
  description = "The second availability zone"
}

variable "private_subnet_cidr_block_1" {
  type        = string
  description = "The CIDR block for the first private subnet"
}

variable "private_subnet_cidr_block_2" {
  type        = string
  description = "The CIDR block for the second private subnet"
}
