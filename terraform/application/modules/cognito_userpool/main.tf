#cognito user pool
resource "aws_cognito_user_pool" "user_pool" {
  name                         = "${var.project}-users-${var.environment}"
  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only
  }
  tags = merge(var.common_tags, tomap({
    "Name" =  "${var.project}-cognito"
    }
  ))
}

#amazon cognito domain 
resource "aws_cognito_user_pool_domain" "cognito_domain" {
  domain                       = "${var.project}-users-${var.environment}"
  user_pool_id                 = aws_cognito_user_pool.user_pool.id
}




