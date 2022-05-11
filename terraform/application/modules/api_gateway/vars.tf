

#REST API
variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "env" {
  description = "The name of the environment"
}

variable "project" {
  description = "The name of the project"
}

variable "rendered_api_swagger_config" {
  description = "Swagger API rendered"
}

variable "logging_level" {
  description = "API logging level"
}

variable "api_throttling_burst_limit" {
  description = "API throttling burst limit"
}

variable "api_throttling_rate_limit" {
  description = "API throttling rate limit."
}

variable "api_gateway_name" {
  default = ""
  description = "api gateway name"
}

variable "endpoint_type" {
  default = "EDGE"
  description = "API endpoint type: EDGE, REGIONAL or PRIVATE"
}

#Cognito authorization
/*
variable "api_gateway_authorizer" {
  description = "API Gateway Cognito Authorizer Name"
}
*/
variable "provider_arns" {
  description = "ARN for userpool"
  default = []
}