output "s3_bucket_website_endpoint" {
  value = aws_s3_bucket_website_configuration.s3_bucket.website_endpoint
  description = "endpoint url of s3 static hosting"
}