#General variables
variable "region" {
    description = "default region for provider"
    type    = string
    default = "us-east-1" 
}

# #ec2 variables
# variable "instance_name" {
#     description   = "Name of EC2 instance"
#     type          = string 
# }

variable "ami" {
    description = "Amazon machine image to use fo ec2 instnace"
    type        = string
    default     = "ami-0c7217cdde317cfec"

}

variable "instance_type" {
    description = "ec2 instance type"
    type        = string
    default     = "t2.micro"  
}


#s3 variables
variable "bucket_name" {
    description = "name of the bucket for app data"
    type        = string 
}

#route 53 variables
variable "domain" {
    description = "Domain for website"
    type        = string
}

#rds variables
# variable "db_name" {
#     description = "name of db"
#     type        = string
# }

variable "db_user" {
    description = "username for database"
    type        = string
    default     = "foo"   
}

variable "db_pass" {
    description = "database password"
    type        = string
    sensitive   = true
  
}