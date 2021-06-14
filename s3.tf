# Create a local value with the current timestamp
locals {
  timestamp = timestamp()
}

# Create a S3 bucket to store files
resource "aws_s3_bucket" "b1" {
  acl = "private"
  tags = {
    "Name"  = "Flugel"
    "Owner" = "InfraTeam"
  }
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