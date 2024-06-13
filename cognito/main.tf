resource "aws_cognito_user_pool" "pool" {
    name = "comyamazonmangementae40753f_userpool_ae40753f-dev"

    username_attributes = ["email"]
    auto_verified_attributes = ["email"]

    schema {
        attribute_data_type      = "String"
        developer_only_attribute = false
        mutable                  = true
        name                     = "email"
        required                 = true

        string_attribute_constraints {
            max_length = "2048"
            min_length = "0"
        }
    }

    user_attribute_update_settings {
        attributes_require_verification_before_update = ["email"]
    }

    username_configuration {
        case_sensitive = false
    }
}

resource "aws_cognito_user_pool_client" "client" {
    name = "comyamae40753f_app_client"
    user_pool_id = aws_cognito_user_pool.pool.id

    refresh_token_validity = 30
    auth_session_validity = 3

    token_validity_units {
        refresh_token = "days"
        access_token = "hours"
        id_token = "hours"
    }
}

resource "aws_cognito_user_pool_client" "client_web" {
    name = "comyamae40753f_app_clientWeb"
    user_pool_id = aws_cognito_user_pool.pool.id

    refresh_token_validity = 30
    auth_session_validity = 3

    token_validity_units {
        refresh_token = "days"
        access_token = "hours"
        id_token = "hours"
    }
}