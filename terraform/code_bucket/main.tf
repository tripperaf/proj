terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

locals {

  lambda_bucket_name            =  format("%s-code-%s",var.project, var.environment)
  common_tags = {
    Project                     = var.project
    Environment                 = var.environment
    CreatedBy                   = "Terraform"
    CostCategory                = var.cost_category
  }
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = local.lambda_bucket_name
  tags   = local.common_tags
}

resource "aws_s3_bucket_acl" "lambda_bucket_acl" {
  bucket = "${aws_s3_bucket.lambda_bucket.id}"
  acl    = "private"
}


resource "aws_s3_bucket_public_access_block" "s3Public_lambda" {
  bucket = "${aws_s3_bucket.lambda_bucket.id}"
  block_public_acls = true
  block_public_policy = true
  restrict_public_buckets = true
  ignore_public_acls = true
}