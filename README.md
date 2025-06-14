# Infrastructure Setup and Usage

## Overview

This workflow sets up a Terraform deployment pipeline using GitHub Actions.
It includes steps for checking Terraform code formatting, generating a plan,
and applying the plan to AWS infrastructure using OIDC for authentication.

## Prerequisites

- [Terraform](https://www.terraform.io/) (version X.Y.Z or higher)
- [AWS CLI](https://aws.amazon.com/cli/) (if deploying to AWS)
- Appropriate cloud provider credentials (e.g., AWS access keys)

## Setup Instructions

1. **Clone the Repository**
    ```sh
    git clone https://github.com/OmarHadzhi/rsschool-devops-course-tasks
    cd rsschool-devops-course-tasks
    ```

2. **Configure Cloud Credentials**
    - Ensure your cloud provider credentials are available in your environment (e.g., `~/.aws/credentials` for AWS).

3. **Initialize Terraform**
    ```sh
    terraform init
    ```

4. **Review and Apply Infrastructure Changes**
    - Preview the changes:
      ```sh
      terraform plan
      ```
    - Apply the changes:
      ```sh
      terraform apply
      ```

5. **Access Provisioned Resources**
    - Outputs such as endpoints, resource IDs, and credentials will be displayed after a successful apply.
    - Use these outputs to configure your application or CI/CD pipelines.

## Usage

- **Updating Infrastructure:**  
  Modify the relevant `.tf` files and re-run `terraform plan` and `terraform apply` to update resources.

- **Destroying Infrastructure:**  
  To tear down all resources created by this setup:
  ```sh
  terraform destroy
  ```

## Best Practices

- Commit your infrastructure code to version control.
- Store sensitive variables (e.g., secrets, passwords) in a secure location and reference them using environment variables or secret managers.
- Use remote state backends for collaborative environments.

## Troubleshooting

- Ensure your credentials are valid and have sufficient permissions.
- Check the Terraform documentation for error messages and troubleshooting steps.
- For provider-specific issues, consult the respective cloud provider documentation.


---
