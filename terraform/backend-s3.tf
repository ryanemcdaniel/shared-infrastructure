resource "aws_s3_bucket" "backend" {
  bucket = "ryanemcdaniel-terraform"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend" {
  bucket = aws_s3_bucket.backend.bucket
}

resource "aws_s3_bucket_acl" "backend" {
  bucket = aws_s3_bucket.backend.bucket
}

resource "aws_s3_bucket_versioning" "backend" {
  bucket = aws_s3_bucket.backend.bucket
}

data "aws_iam_policy_document" "backend" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
    principals {
      type        = "AWS"
      identifiers = [module.global.aws_acc_id]
    }
  }
}

resource "awscc_s3_bucket_policy" "backend" {
  bucket          = aws_s3_bucket.backend.bucket
  policy_document = data.aws_iam_policy_document.backend.json
}