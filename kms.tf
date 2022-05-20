resource "aws_kms_key" "general" {
  description             = "General key for ${var.name}"
  deletion_window_in_days = 10

  policy = data.aws_iam_policy_document.general_key_policy.json
}

resource "aws_kms_alias" "a" {
  name          = "alias/${var.name}-general"
  target_key_id = aws_kms_key.general.key_id
}

data "aws_iam_policy_document" "general_key_policy" {
  statement {
    # Allows default root permissions
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${local.account_id}:root"
      ]
    }
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    # Allows CloudTrail to use the general KMS key to encrypt when writing to CT bucket
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "kms:GenerateDataKey*"
    ]

    resources = [
      "*"
    ]

    condition {
      test     = "StringLike"
      variable = "kms:EncryptionContext:aws:cloudtrail:arn"
      values = [
        local.cloudtrail_arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values = [
        local.cloudtrail_arn
      ]
    }
  }
}
