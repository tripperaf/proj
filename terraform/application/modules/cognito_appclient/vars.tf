variable "project" {
  description = "name of the project"
}

variable "environment" {
  description = "name of the environment"
}

variable "user_pool_id"{
  description = "cognito user pool id"
}

variable "generate_secret" {
  description = "whether to generate secrets or not"
  default = true
}

variable "allowed_oauth_flows_user_pool_client" {
  description = "whther to allow oauth flows"
  default = true
}

variable "allowed_oauth_flow" {
  description = "aauth flow for the app client"
}

variable "access_token_validity" {
  description = "cognito access token validity for app client"
  default = "1"
}

variable "refresh_token_validity" {
  description = "cognito refresh token validity for app client"
  default = "1"
}

variable "id_token_validity" {
  description = "id token validity for app client"
  default = "1"
}

variable "explicit_auth_flows" {
  description = "auth flows for app client"
  default = ["ALLOW_REFRESH_TOKEN_AUTH","ALLOW_USER_SRP_AUTH","ALLOW_USER_PASSWORD_AUTH","ALLOW_CUSTOM_AUTH"]
}

variable "prevent_user_existence_errors" {
  description = "prevent user existence errors"
  default = "ENABLED"
}

variable "identifier" {
  description = "scope identifier"
  default = ""
}

variable "scope_name" {
  description = "scope name"
  default = ""
}

variable "scope_description" {
  description = "scope description"
  default = "custom scope for aircall service"
}

variable "allowed_oauth_scopes" {
  description = "allowed oauth scopes"
}
