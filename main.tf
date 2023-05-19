resource "aws_s3_bucket" "s3bucket" {
  bucket= var.bucket
  tags= var.tags
}