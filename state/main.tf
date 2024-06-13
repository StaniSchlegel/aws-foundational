resource "aws_s3_bucket" "terraform_state_bucket" {
    bucket = "comycom-prod-terraform"
}

resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
    bucket = aws_s3_bucket.terraform_state_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_bucket_block" {
    bucket = aws_s3_bucket.terraform_state_bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_state_table" {
    name           = "terraform-state"
    read_capacity  = 20
    write_capacity = 20
    hash_key       = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}