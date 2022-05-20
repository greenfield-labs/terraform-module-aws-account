resource "aws_cloudtrail" "this" {
  name                          = aws_s3_bucket.cloudtrail.id
  s3_bucket_name                = aws_s3_bucket.cloudtrail.id
  kms_key_id                    = aws_kms_key.general.arn
  include_global_service_events = false

  # Cloudtrail requires a valid bucket policy, and the bucket policy
  # requires the Cloudtrail ARN, so we use `local.cloudtrail_arn` in the
  # bucket policy and then add this depends on, otherwise your first apply
  # will error
  depends_on = [aws_s3_bucket_policy.cloudtrail]
}
