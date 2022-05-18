
project                                           = "aircall"
cost_category                                     = "aircall"
environment                                       = "dev"

#Cognito
allowed_oauth_flow                                = ["client_credentials"]
identifier                                        = "aircall"
scope_name                                        = "image"

#API
api_logging_level                                 = "OFF"
api_throttling_burst_limit                        = 100
api_throttling_rate_limit                         = 100
endpoint_configuration_type                       = "REGIONAL"
//logging_level                                     = "INFO"
api_gateway_name                                  = "aircall-resize-image"
api_gateway_authorizer                            = "aircall-authorization"
cognito_allowed_oauth_scopes                      = "aircall/image"

#Lambda
lambda_memory_size                                = "256"
