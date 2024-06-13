output "default_cognito_user_pool" {
    value = aws_cognito_user_pool.pool
}

output "cognito_user_pool_client_id" {
    value = aws_cognito_user_pool_client.client.id
}

output "cognito_user_pool_client_web_id" {
    value = aws_cognito_user_pool_client.client_web.id
}