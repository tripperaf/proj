output "base_url" {
  value = module.APIGateway.base_url
}

output "api_name" {
  value = "${var.project}-apigateway-${var.environment}"
}

output "api_arn" {
  value = module.APIGateway.api_arn
}

output "api_id" {
  value = module.APIGateway.api_id
}