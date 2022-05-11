
output "allowed_allocation_oauth_scope"{
  value = aws_cognito_resource_server.aircall_resource_server.scope_identifiers
}
 
output "app_client_id" {
  value = aws_cognito_user_pool_client.app_client.id
}

output "app_client_secret" {
  value = aws_cognito_user_pool_client.app_client.client_secret
}

