resource "trocco_connection" "s3_connection" {
  name            = var.connection_name
  description     = var.connection_description
  connection_type = "s3"

  # AWS S3設定
  aws_auth_type    = "iam_user"
  aws_iam_user = {
    access_key_id     = var.aws_access_key
    secret_access_key = var.aws_secret_key
  }
}