resource "aws_s3_bucket" "s3" {
  bucket = var.s3_bucket_name

}


resource "aws_s3_bucket_ownership_controls" "acl" {
    bucket = aws_s3_bucket.s3.id

    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}


resource "aws_s3_bucket_versioning" "s3" {
  bucket = aws_s3_bucket.s3.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "pbaccess" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = var.s3_block_public_acls 
  block_public_policy     = var.s3_block_public_policy   
  ignore_public_acls      = var.s3_ignore_public_acls 
  restrict_public_buckets = var.s3_restrict_public_buckets


}


resource "aws_s3_object" "obj" {
  bucket = aws_s3_bucket.s3.id
  source = var.s3_object_source
  key = var.s3_object_key
  content_type = var.s3_object_content_type
}



resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3.id

  index_document {
    suffix = var.s3_object_suffix
  }
}


resource "aws_s3_bucket_policy" "name" {
  bucket = aws_s3_bucket.s3.id

   policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.s3.arn}/*"
      }
    ]
  })
}

