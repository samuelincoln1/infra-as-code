terraform {
    # backend "s3" {
    #     bucket = "samuellincoln-terraform-state"
    #     key = "tf-infra/terraform.tfstate"  
    #     region = "us-east-1"
    #     dynamodb_table = "terraform-state-locking"
    #     encrypt = true
    # }

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = var.bucket_name
    force_destroy = true

}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
    bucket = aws_s3_bucket.terraform_state.id
    versioning_configuration {
        status = "Enabled"
        
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
    bucket = aws_s3_bucket.terraform_state.id
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = var.sse_algorithm
        }
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name = var.dynamodb_table_name
    billing_mode = var.billing_mode
    hash_key = var.hash_key
    attribute {
        name = var.attribute_name
        type = var.attribute_type
    }
}