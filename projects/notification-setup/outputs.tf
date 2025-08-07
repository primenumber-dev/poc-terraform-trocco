output "notification_ids" {
  description = "IDs of the created notification destinations"
  value       = trocco_notification_destination.email_notification[*].id
}

output "notification_id_1" {
  description = "First notification destination ID (y-inaba)"
  value       = trocco_notification_destination.email_notification[0].id
}

output "notification_id_2" {
  description = "Second notification destination ID (s-wada)"
  value       = length(trocco_notification_destination.email_notification) > 1 ? trocco_notification_destination.email_notification[1].id : null
}