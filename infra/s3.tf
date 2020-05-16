resource "aws_s3_bucket" "bucket" {
  bucket = "buckets3620189"
  versioning {
    enabled = true
  }

}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "s3620189"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "buckets3620189"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "s3620189"
  }


}

