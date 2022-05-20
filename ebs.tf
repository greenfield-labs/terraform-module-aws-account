# Enables EBS volume encryption at rest by default using the General KMS key
resource "aws_ebs_default_kms_key" "this" {
  key_arn = aws_kms_key.general.arn
}

resource "aws_ebs_encryption_by_default" "this" {
  enabled = true
}
