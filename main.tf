provider "aws" {
     region = "us-east-1"
  }

resource "aws_s3_bucket" "b1" {
    acl = "private"
    tags = {
    "Name" = "Flugel"
    "Owner" = "InfraTeam"
  }
}

resource "aws_s3_bucket_object" "test1" {
  bucket = aws_s3_bucket.b1.id
  key = "test1.txt"
  content = "${timestamp()}"
  acl = "public-read"
}

resource "aws_s3_bucket_object" "test2" {
  bucket = aws_s3_bucket.b1.id
  key = "test2.txt"
  content = "${timestamp()}"
  acl = "public-read"
}
