resource "aws_cognito_resource_server" "aircall_resource_server" {
  identifier                           = var.aircall_identifier
  name                                 = "${var.project}-${var.environment}"

#custom scope for resource server
  scope {
    scope_name                         = var.aircall_scope_name
    scope_description                  = var.aircall_scope_description
  }
  user_pool_id                         = var.user_pool_id
}

#app client for user pool
resource "aws_cognito_user_pool_client" "app_client" {
  name                                 = "${var.project}-${var.environment}"
  user_pool_id                         = var.user_pool_id
  generate_secret                      = var.generate_secret
  allowed_oauth_flows                  = var.allowed_oauth_flow
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes                 = ["${var.aircall_identifier}/${var.aircall_scope_name}"]
  refresh_token_validity               = var.refresh_token_validity
  id_token_validity                    = var.id_token_validity
  explicit_auth_flows                  = var.explicit_auth_flows 
  access_token_validity                = var.access_token_validity
  prevent_user_existence_errors        = var.prevent_user_existence_errors

 depends_on =[aws_cognito_resource_server.aircall_resource_server] 
}


