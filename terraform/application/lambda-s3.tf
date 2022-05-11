data "aws_canonical_user_id" "current" {}

resource "aws_s3_bucket" "output_bucket" {
  bucket = local.lambda_output_bucket
  tags   = local.common_tags
}


resource "aws_s3_bucket_acl" "output_bucket_acl" {
  bucket = "${aws_s3_bucket.output_bucket.id}"
  access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "READ_ACP"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}

resource "aws_s3_bucket_public_access_block" "s3Public_output" {
  bucket = "${aws_s3_bucket.output_bucket.id}"
  block_public_acls = false
  block_public_policy = false
  restrict_public_buckets = false
  ignore_public_acls = false
}


module "lambda" {
  source               = "./modules/lambda"
  s3_bucket            = local.lambda_bucket_name
  s3_key               = var.lambda_s3_key
  function_name        = local.lambda_function_name
  description          = var.lambda_description
  role                 = module.security.lambda_task_role_arn
  handler              = var.lambda_handler
  runtime              = var.lambda_runtime
  timeout              = var.lambda_timeout
  memory_size          = var.lambda_memory_size
  vpc_enabled          = false
  env_vars             = local.lambda_env
  role_name            = module.security.lambda_task_role_name
  lambda_log_group_policy = "${var.project}-resize-lambda-logging-${var.environment}"
  common_tags          = {
    Name = local.lambda_function_name
  }

  depends_on = [ aws_s3_bucket.output_bucket ]
}

module "security" {
  source = "./modules/Security-And-Authentication"
  env = var.environment
  project = var.project
  region = var.region
  lambda_bucketname = local.lambda_bucket_name
  output_bucketname = local.lambda_output_bucket
  aws_account_id = local.aws_account_id

 depends_on = [ aws_s3_bucket.output_bucket  ]
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowMyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.lambda_function_name
  principal     = "apigateway.amazonaws.com"

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${module.APIGateway.api_arn}/*/*/*"
}