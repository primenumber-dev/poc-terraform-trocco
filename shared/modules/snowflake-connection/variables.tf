# 共通Snowflake接続モジュール - プロジェクト固有部分のみ変数化

variable "connection_name" {
  description = "Name of the Snowflake connection"
  type        = string
}

variable "connection_description" {
  description = "Description of the Snowflake connection"
  type        = string
  default     = "Snowflake接続設定"
}

variable "snowflake_account" {
  description = "Snowflake account identifier"
  type        = string
}

variable "snowflake_username" {
  description = "Snowflake username"
  type        = string
}

variable "snowflake_password" {
  description = "Snowflake password"
  type        = string
  sensitive   = true
}

variable "snowflake_role" {
  description = "Snowflake role"
  type        = string
}