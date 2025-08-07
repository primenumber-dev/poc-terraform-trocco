variable "trocco_api_key" {
  description = "Trocco API key"
  type        = string
  sensitive   = true
}

# Snowflake Connection variables
variable "snowflake_connection_name" {
  description = "Name of the Snowflake connection"
  type        = string
  default     = "snowflake_production_connection"
}

variable "snowflake_connection_description" {
  description = "Description of the Snowflake connection"
  type        = string
  default     = "Snowflakeの接続設定"
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

# S3 Connection variables
variable "s3_connection_name" {
  description = "Name of the S3 connection"
  type        = string
  default     = "s3_production_connection"
}

variable "s3_connection_description" {
  description = "Description of the S3 connection"
  type        = string
  default     = "S3接続設定"
}

variable "aws_access_key" {
  description = "AWS access key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret access key"
  type        = string
  sensitive   = true
}