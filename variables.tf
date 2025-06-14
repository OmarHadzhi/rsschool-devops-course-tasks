variable "aws_region" {
  type        = string
  description = "AWS region for current resources"
  default     = "us-east-1"
}

variable "policy_arns" {
  type        = list(string)
  description = "List of IAM policy ARNs for GitHub Actions role"
  sensitive   = true
}

variable "github_username" {
  type        = string
  sensitive   = true
  description = "GitHub username for the repository that will use GitHub Actions"
}

variable "github_repo" {
  type        = string
  sensitive   = true
  description = "GitHub repository name that will use GitHub Actions"
}

variable "sample_bucket" {
  type        = string
  sensitive   = true
  description = "Name of the S3 bucket to be created for GitHub Actions artifacts"
}