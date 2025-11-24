# IaC Comparison: CloudFormation vs Terraform (Serverless)

This repository contains a complete hands-on project implementing the same **serverless microservice** architecture
twice: once using **Terraform** modules and once using **AWS CloudFormation** nested stacks.

Architecture: API (API Gateway) -> Lambda -> DynamoDB. VPC (minimal), IAM, and S3 for artifacts.

Folders:
- `terraform/` : Terraform implementation (modules + envs)
- `cloudformation/` : CloudFormation nested templates and root stack
- `lambda-src/` : Sample Lambda app code
- `ci/` : GitHub Actions workflows for Terraform and CloudFormation
- `research/` : scripts for collecting metrics and analyzing results


