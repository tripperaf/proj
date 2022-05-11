terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

locals {
  aws_account_id = data.aws_caller_identity.current.account_id
  lambda_bucket_name                = format("%s-code-%s",var.project, var.environment)
  lambda_function_name              = format("%s-resize-image-%s",var.project, var.environment)
  lambda_output_bucket              = format("%s-resized-image-%s",var.project, var.environment)
  lambda_env = {
    S3_BUCKET = local.lambda_output_bucket 
  }
  common_tags = {
    Project                     = var.project
    Environment                 = var.environment
    CreatedBy                   = "Terraform"
    CostCategory                = var.cost_category
  }
}

