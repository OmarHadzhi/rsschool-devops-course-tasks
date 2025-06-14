#Create s3 bucket:
resource "aws_s3_bucket" "github_actions_bucket" {
  bucket = var.sample_bucket

  tags = {
    Name        = "GitHub Actions Bucket"
    Environment = "DevOps Course"
  }
}