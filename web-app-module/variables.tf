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

# variable "ami" {
#     description = "Amazon machine image to use fo ec2 instnace"
#     type        = string
#     default     = "ami-0c7217cdde317cfec"

# }

# variable "instance_type" {
#     description = "ec2 instance type"
#     type        = string
#     default     = "t2.micro"  
# }


# #s3 variables
# variable "bucket_name" {
#     description = "name of the bucket for app data"
#     type        = string 
# }

# #route 53 variables
# variable "domain" {
#     description = "Domain for website"
#     type        = string
# }

# #rds variables
# # variable "db_name" {
# #     description = "name of db"
# #     type        = string
# # }

# variable "db_user" {
#     description = "username for database"
#     type        = string
#     default     = "foo"   
# }

# variable "db_pass" {
#     description = "database password"
#     type        = string
#     sensitive   = true
  
# }

variable "app_name" {
  description = "Name of the web application"
  type        = string
  default     = "web-app"
}

variable "environment_name" {
  description = "Deployment environment (dev/staging/production)"
  type        = string
  default     = "dev"
}

# EC2 Variables

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

# S3 Variables

variable "bucket_name" {
  description = "prefix of s3 bucket for app data"
  type        = string
}

# Route 53 Variables

variable "create_dns_zone" {
  description = "If true, create new route53 zone, if false read existing route53 zone"
  type        = bool
  default     = false
}

variable "domain" {
  description = "Domain for website"
  type        = string
}

# RDS Variables

variable "db_name" {
  description = "Name of DB"
  type        = string
}

variable "db_user" {
  description = "Username for DB"
  type        = string
}

variable "db_pass" {
  description = "Password for DB"
  type        = string
  sensitive   = true
}