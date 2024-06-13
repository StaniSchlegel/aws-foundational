terraform {
    backend "s3" {
        bucket  = "comycom-prod-terraform"
        key  = "foundational/cognito/terraform.tfstate"
        region = "eu-central-1"
        encrypt = true
        dynamodb_table = "terraform-state"
    }
}
