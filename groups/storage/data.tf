
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
}
