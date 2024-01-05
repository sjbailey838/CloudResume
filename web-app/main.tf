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

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "stevessandboxbucket" # REPLACE WITH YOUR BUCKET NAME
  force_destroy = true
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

# variable "db_pass_1" {
#     description = "password for first database"
#     type        = string
#     sensitive   = true 
  
# }

# variable "db_pass_2" {
#     description = "password for second database"
#     type        = string
#     sensitive   = true 
  
# # }

module "web_app_1" {
    source = "../web-app-module"
    
    #input variables
    bucket_name      = "web-app-1-data"
    domain           = "stevessandbox.xyz"
    app_name         = "web-app-1"
    environment_name = "test"
    instance_type    = "t2.micro"
    db_name = "webapp1db"
    db_pass = "password"
    db_user = "foo"
}
module "web_app_2" {
  source = "../web-app-module"

    #input variables
    bucket_name      = "web-app-2-data"
    domain           = "stevessandbox.xyz"
    app_name         = "web-app-2"
    environment_name = "production"
    instance_type    = "t2.micro"
    db_name = "webapp2db"
    db_pass = "password"
    db_user = "foo"
}
