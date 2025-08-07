variable "trocco_api_key" {
  description = "Trocco API key"
  type        = string
  sensitive   = true
}

variable "email_addresses" {
  description = "List of email addresses for notifications"
  type        = list(string)
}