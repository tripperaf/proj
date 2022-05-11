module "user_pool" {
  source                        = "./modules/cognito_userpool"
  project                       = var.project
  environment                   = var.environment
  common_tags                   = local.common_tags
}

module "app_client"{
  source                         = "./modules/cognito_appclient"
  project                        = var.project
  environment                    = var.environment
  allowed_oauth_flow             = var.allowed_oauth_flow
  user_pool_id                   = module.user_pool.user_pool_id
}