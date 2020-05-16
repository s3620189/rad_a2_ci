resource "aws_s3_bucket" "bucket" {
  bucket = "app_bucket"
  acl    = "public"

  tags = {
    Name        = "app_bucket"
    Environment = "Dev"

  }

}


