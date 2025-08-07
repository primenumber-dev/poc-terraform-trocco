output "snowflake_connection_id" {
  description = "ID of the created Snowflake connection"
  value       = module.snowflake_connection.connection_id
}

output "s3_connection_id" {
  description = "ID of the created S3 connection"
  value       = module.s3_connection.connection_id
}

output "snowflake_connection_name" {
  description = "Name of the created Snowflake connection"
  value       = module.snowflake_connection.connection_name
}

output "s3_connection_name" {
  description = "Name of the created S3 connection"
  value       = module.s3_connection.connection_name
}