# output "outputendpoint" {
#   value = module.s3_bucket.s3_bucket_website_endpoint
# }



output "rds_endpoint" {
  value = module.aws_rds.endpoint
}