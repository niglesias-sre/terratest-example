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
  value = local.timestamp
}