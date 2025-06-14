terraform {
  backend "s3" {
    bucket = "my-tfstate-s3-bucket-1221"
    #dynamodb_table = "state-lock"
    key          = "global/mystatefile/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # Enables native S3 state locking

  }

  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.34"
    }
  }
}

provider "aws" {
  region = var.aws_region
}