output "connection_id" {
  description = "ID of the created S3 connection"
  value       = trocco_connection.s3_connection.id
}

output "connection_name" {
  description = "Name of the created S3 connection"
  value       = trocco_connection.s3_connection.name
}