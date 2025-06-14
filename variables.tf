variable "aws_region" {
  type        = string
  description = "AWS region for current resources"
  default     = "us-east-1"
}

variable "policy_arns" {
  type        = list(string)
  description = "List of IAM policy ARNs for GitHub Actions role"
}

variable "github_username" {
  type = string
}

variable "github_repo" {
  type = string
}

variable "sample_bucket" {
  type = string
}