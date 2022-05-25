# Enables EBS volume encryption at rest by default using the General KMS key
resource "aws_ebs_default_kms_key" "this" {
  count   = var.enforce_ebs_encryption ? 1 : 0
  key_arn = aws_kms_key.general.arn
}

resource "aws_ebs_encryption_by_default" "this" {
  enabled = var.enforce_ebs_encryption
}
