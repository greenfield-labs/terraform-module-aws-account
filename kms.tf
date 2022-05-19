resource "aws_kms_key" "account" {
  description             = "Account key for ${var.name}"
  deletion_window_in_days = 10
}