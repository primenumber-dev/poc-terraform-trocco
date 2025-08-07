output "connection_id" {
  description = "ID of the created Snowflake connection"
  value       = trocco_connection.snowflake_connection.id
}

output "connection_name" {
  description = "Name of the Snowflake connection"
  value       = trocco_connection.snowflake_connection.name
}