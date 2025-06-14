# Infrastructure Setup and Usage:

## Overview

This workflow sets up a Terraform deployment pipeline using GitHub Actions.
It includes steps for checking Terraform code formatting, generating a plan,
and applying the plan to AWS infrastructure using OIDC for authentication.

## Prerequisites
Before starting, ensure the following tools are installed:

- [AWS CLI 2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Terraform 1.6+](https://developer.hashicorp.com/terraform/downloads)
- (Optional) [Terraform Version Manager (tfenv)](https://github.com/tfutils/tfenv)

## Steps to Set Up Infrastructure

### 1. Create IAM User and Configure MFA
- In AWS IAM, create a new user and attach the following policies:
  - `AmazonEC2FullAccess`
  - `AmazonRoute53FullAccess`
  - `AmazonS3FullAccess`
  - `IAMFullAccess`
  - `AmazonVPCFullAccess`
  - `AmazonSQSFullAccess`
  - `AmazonEventBridgeFullAccess`
- Configure MFA for both the new user and the root user.
- Generate an **Access Key ID** and **Secret Access Key**.

### 2. Configure AWS CLI
- Set up AWS credentials using the new IAM user.
- Verify configuration:
  ```sh
  aws ec2 describe-instance-types --instance-types t4g.nano

### 3. Create GitHub Repository
- Create a repository rsschool-devops-course-tasks in GitHub.
- Push Terraform code to the repository.

### 4. Set Up Terraform Backend
- Create an S3 bucket to store Terraform state.
- Locking Terraform state via DynamoDB is optional but recommended.

### 5. Create IAM Role for GitHub Actions 
- Create a role GitHubActionsRole with the same policies as above.
- Set up an Identity Provider and Trust Policy for GitHub Actions.

### 6. Configure GitHub Actions Workflow
A workflow "terraform-setup.yml" with three jobs will automate Terraform deployments

### Deployment Process:
- Open a Pull Request to trigger Terraform validation (terraform-check and terraform-plan).
- Once reviewed, merge the PR to main, automatically deploying the infrastructure (terraform-apply).



