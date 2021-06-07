# Set up AWS provider
# Credentials must be set up using environment variables
provider "aws" {
  region = "us-east-1"
}

# Create a S3 bucket to store files
resource "aws_s3_bucket" "b1" {
  acl = "private"
  tags = {
    "Name"  = "Flugel"
    "Owner" = "InfraTeam"
  }
}

# Create a local value with the current timestamp
locals {
  timestamp = timestamp()
}

# Create two files containing the timestamp when the
# code was executed
resource "aws_s3_bucket_object" "test1" {
  bucket  = aws_s3_bucket.b1.id
  key     = "test1.txt"
  content = local.timestamp
  acl     = "public-read"
}
resource "aws_s3_bucket_object" "test2" {
  bucket  = aws_s3_bucket.b1.id
  key     = "test2.txt"
  content = local.timestamp
  acl     = "public-read"
}

output "bucket_domain_name" {
  value = aws_s3_bucket.b1.bucket_domain_name
}

output "test1_url" {
  value = "http://${aws_s3_bucket.b1.bucket_domain_name}/${aws_s3_bucket_object.test1.key}"
}

output "test2_url" {
  value = "http://${aws_s3_bucket.b1.bucket_domain_name}/${aws_s3_bucket_object.test2.key}"
}

output "timestamp" {
  value = "${local.timestamp}"
}