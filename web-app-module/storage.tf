resource "aws_s3_bucket" "terraform_state"{
    bucket          = var.bucket_name
    force_destroy   = true
}