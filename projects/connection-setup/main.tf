provider "trocco" {
  region  = "japan"
  api_key = var.trocco_api_key
}

# Snowflake Connection - create once and use ID in other projects
module "snowflake_connection" {
  source = "../../shared/modules/snowflake-connection"
  
  connection_name        = var.snowflake_connection_name
  connection_description = var.snowflake_connection_description
  snowflake_account     = var.snowflake_account
  snowflake_username    = var.snowflake_username
  snowflake_password    = var.snowflake_password
  snowflake_role        = var.snowflake_role
}

# S3 Connection - create once and use ID in other projects
module "s3_connection" {
  source = "../../shared/modules/s3_connection"
  
  connection_name        = var.s3_connection_name
  connection_description = var.s3_connection_description
  aws_access_key         = var.aws_access_key
  aws_secret_key         = var.aws_secret_key
}