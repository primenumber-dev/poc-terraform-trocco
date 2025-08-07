resource "trocco_connection" "snowflake_connection" {
  name            = var.connection_name
  description     = var.connection_description
  connection_type = "snowflake"

  # 共通のSnowflake設定
  host        = var.snowflake_account
  user_name   = var.snowflake_username
  password    = var.snowflake_password
  role        = var.snowflake_role
  auth_method = "user_password"  # 共通デフォルト
  driver      = "snowflake_jdbc_3_17_0"  # 共通デフォルト
}