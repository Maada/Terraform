resource "aws_s3_bucket" "bucket" {
    acl = "private"
    bucket = "my-udemy-bucket"
    force_destroy = "false"

    versioning {
        enabled = "true"
    }

    tags {
            Name = "my-udemy-bucket"
    }
  
}