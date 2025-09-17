resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket = "my-unique-bucket-name-${random_id.bucket_suffix.hex}"
  acl    = "private"
}
