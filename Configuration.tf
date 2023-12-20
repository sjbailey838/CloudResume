terraform {
  backend "s3" {
    bucket          = "stevessandboxbucket"
    key             = "terraform/terraform.tfstate"
    region          = "us-east-1"
    dynamodb_table  = "terraform-state-locking"
    encrypt         = true
  }

  required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
    }
  }
}

  provider "aws" {
      region =  "us-east-1"
  }

  resource "aws_instance" "example"{
      ami             = "ami-0c7217cdde317cfec"
      instance_type   = "t2.micro"
  }

  resource "aws_s3_bucket" "terraform_state"{
      bucket          = "stevessandboxbucket"
      force_destroy   = true
      
}
  resource "aws_dynamodb_table" "terraform_locks" {
    name              = "terraform-state-locking"
    billing_mode      = "PAY_PER_REQUEST"
    hash_key          = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    } 
  }