resource "aws_s3_bucket2" "log_bucket2" {
  bucket = "udemy-terraform-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket3" "c" {
  bucket = "udemy-terraform-bucket"
  acl    = "private"

  logging {
    target_bucket = "${aws_s3_bucket2.log_bucket2.id}"
    target_prefix = "log/"
  }
}

