output "general_kms_key_id" {
  description = "Key ID for the general KMS key"
  value       = aws_kms_key.general.id
}

output "general_kms_key_arn" {
  description = "ARN for the general KMS key"
  value       = aws_kms_key.general.arn
}
