#Create s3 bucket:
resource "aws_s3_bucket" "github_actions_bucket" {
  bucket = "${var.github_username}-${var.github_repo}-actions-bucket"

  tags = {
    Name        = "GitHub Actions Bucket"
    Environment = "DevOps Course"
  }
}