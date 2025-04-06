variable "bucket_name" {
    type = string
    description = "The name of the S3 bucket to store the Terraform state"
}

variable "sse_algorithm" {
    type = string
    description = "The algorithm to use for server-side encryption"
}


variable "dynamodb_table_name" {
    type = string
    description = "The name of the DynamoDB table to store the Terraform state locks"
}

variable "billing_mode" {
    type = string
    description = "The billing mode for the DynamoDB table"
}

variable "attribute_name" {
    type = string
    description = "The name of the attribute to use for the DynamoDB table"
}

variable "attribute_type" {
    type = string
    description = "The type of the attribute to use for the DynamoDB table"
}

variable "hash_key" {
    type = string
    description = "The hash key for the DynamoDB table"
}









