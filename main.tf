provider "aws" {
  region = var.region
}

module "s3-bucket" {
  source  = "app.terraform.io/michael_garcia_spesonycom/s3-bucket/aws"
  version = "2.9.0"

  bucket        = "${var.prefix}-${var.bucket_name}"
  acl           = "public-read"
  policy        = data.aws_iam_policy_document.website_policy.json
  force_destroy = true

  versioning = {
    enabled = true
  }

  website = {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "index-html" {
  bucket = module.s3-bucket.s3_bucket_id
  key    = "index.html"
  acl    = "public-read"

  content      = templatefile("${path.module}/index.tpl", { placeholder = var.placeholder, width = var.width, height = var.height, prefix = var.prefix })
  content_type = "text/html"
}

data "aws_iam_policy_document" "website_policy" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = [
      "arn:aws:s3:::${var.prefix}-${var.bucket_name}"
    ]
  }
}
