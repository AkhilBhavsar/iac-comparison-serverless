terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
  backend "s3" {
    bucket         = "iac-tf-state-ca2-2025"     # replace with your bucket
    key            = "dev/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "iac-tf-locks-ca2-2025"         # replace with your lock table
    encrypt        = true
  }
}

provider "aws" { region = "eu-west-1" }

# VPC
module "vpc" {
  source = "../../modules/vpc"
  cidr   = "10.0.0.0/16"
  region = "eu-west-1"
  team_tag = "networking-B"
}

# DynamoDB
module "db" {
  source     = "../../modules/dynamodb"
  table_name = "demo-table-dev"
}

# Lambda - requires you to upload hello.zip to S3 and set s3_bucket & s3_key appropriately
module "app" {
  source        = "../../modules/lambda"
  function_name = "demo-hello-tf"
  s3_bucket     = "iac-lambda-artifacts-ca2-2025"
  s3_key        = "hello.zip"
  table_name    = module.db.table_name
  region        = "eu-west-1"
  owner_tag = "team-app-B"
}
