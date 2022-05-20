locals {
  account_id      = data.aws_caller_identity.this.account_id
  region          = data.aws_region.this.name
  cloudtrail_arn  = "arn:aws:cloudtrail:${local.region}:${local.account_id}:trail/${local.cloudtrail_name}"
  cloudtrail_name = "${var.name}-cloudtrail"
}
