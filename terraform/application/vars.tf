variable "project" {
    description = "name of the project"
}

variable "environment" {
    description = "name of the environment"
}

variable "cost_category" {
  description = "cost_category"
}

variable "region"{
  description = "aws region"
}

#Cognito

variable "allowed_oauth_flow" {
  description = "aauth flow for the app client"
}

#API Gateway

variable "logging_level" {
  description = "logging_level"
}

variable "api_throttling_burst_limit" {
  description = "api_throttling_burst_limit"
}

variable "api_throttling_rate_limit" {
  description = "api_throttling_rate_limit"
}

variable "endpoint_configuration_type" {
  description = "The endpoint configuration type to be used i.e. regional, edge optimized"
}

variable "api_logging_level" {
  description = "api_logging_level"
}

variable "api_gateway_name" {
    description = "API gateway name"
}

variable "api_gateway_authorizer" {
  description = "API Gateway Cognito Authorizer Name"
}

variable "cognito_allowed_oauth_scopes" {
  description = "allowed cognito oauth scopes"
}

variable "provider_arns" {
  description = "ARN for userpool"
  default = []
}

#Lambda

variable "lambda_s3_key" {
  default = "lambda jar file location"
}

variable "lambda_description" {
  description = "lambda description"
  default = "lambda to resize images"
}

variable "lambda_handler" {
  description = "lambda handler"
  default = "app.lambdaHandler"
}

variable "lambda_runtime" {
  description = "lambda runtime"
  default = "nodejs12.x"
}

variable "lambda_memory_size" {
  description = "lambda memory"
  default = "256"
}

variable "lambda_timeout" {
  description = "lambda timeout"
  default = "60"
}

