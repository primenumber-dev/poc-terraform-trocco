provider "trocco" {
  region  = "japan"
  api_key = var.trocco_api_key
}

# Notification destinations - create once and use IDs in other projects
resource "trocco_notification_destination" "email_notification" {
  count = length(var.email_addresses)
  type  = "email"
  
  email_config = {
    email = var.email_addresses[count.index]
  }
}