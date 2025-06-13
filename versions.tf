terraform {
  backend "s3" {
    bucket         = "my-s3-tfstate-test-bucket"
    dynamodb_table = "state-lock"
    key            = "global/mystatefile/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true

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