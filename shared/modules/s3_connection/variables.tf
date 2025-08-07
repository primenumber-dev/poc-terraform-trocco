variable "connection_name" {
  description = "Name of the S3 connection"
  type        = string
}

variable "connection_description" {
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