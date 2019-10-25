resource "aws_s3_bucket" "b" {
  #bucket = "my-98ashishy-bucket.in"
  bucket="${var.bucket_name}"
  acl    = "private"

  tags = {
    Name        = "${var.bucket_name}"
    Cluster = "kops"
  }
}
