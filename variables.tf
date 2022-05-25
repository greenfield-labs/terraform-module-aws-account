variable "name" {
  description = "The name of the account"
}

variable "enforce_ebs_encryption" {
  description = "Whether to enforce EBS volume encryption at the account level"
  default     = false
}

variable "github_actions_oidc_enabled" {
  default = true
}
