
data "aws_iam_user" "concourse" {
  user_name = "concourse-server-staging"
}

data "aws_iam_policy_document" "bucket" {
  statement {
    sid = "AllowDeleteObjectFromPipelines"

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_iam_user.concourse.arn]
    }

    actions = [
      "s3:DeleteObject"
    ]

    resources = [
      "${aws_s3_bucket.logs.arn}/*"
    ]
  }

  statement {
    sid = "DenyIncorrectEncryptionHeader"

    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.logs.arn}/*"
    ]

    condition {
      test     = "StringNotEquals"
      variable = "s3:x-amz-server-side-encryption"
      values   = ["AES256"]
    }
  }

  statement {
    sid = "DenyUnencryptedObjectUploads"

    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.logs.arn}/*"
    ]

    condition {
      test     = "Null"
      variable = "s3:x-amz-server-side-encryption"
      values   = ["true"]
    }
  }
}
