data "template_file" "api_swagger_config" {
  template = file("templates/swagger.json")

  vars = {
    api_gateway_name                         = var.api_gateway_name
    region                                   = var.region          
    account_id                               = local.aws_account_id     
    cognito_allowed_oauth_scopes             = var.cognito_allowed_oauth_scopes
    api_gateway_authorizer                   = var.api_gateway_authorizer
    lambda_name                              = local.lambda_function_name
    cognito_provider_arns                    = module.user_pool.user_pool_arn
  }
}

module "APIGateway" {
  source                                     = "./modules/api_gateway"
  project                                    = var.project
  env                                        = var.environment
  rendered_api_swagger_config                = data.template_file.api_swagger_config.rendered
  common_tags                                = local.common_tags
  logging_level                              = var.api_logging_level
  api_throttling_burst_limit                 = var.api_throttling_burst_limit
  api_throttling_rate_limit                  = var.api_throttling_rate_limit
  endpoint_type                              = var.endpoint_configuration_type
  provider_arns                              = [module.user_pool.user_pool_arn]
  api_gateway_authorizer                     = var.api_gateway_authorizer
  api_gateway_name                            = var.api_gateway_name
  depends_on = [
    module.user_pool,
    module.lambda
  ]                        
}
