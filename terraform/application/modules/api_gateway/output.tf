output "base_url" {
  value = aws_api_gateway_deployment.deploy_api.invoke_url
}

output "api_name" {
  value = "${var.project}-apigateway-${var.env}"
}

output "api_arn" {
  value = aws_api_gateway_rest_api.api.execution_arn
}

output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}