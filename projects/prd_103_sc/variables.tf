variable "trocco_api_key" {
  description = "Trocco API key"
  type        = string
  sensitive   = true
}


# Job variables
variable "contact_job_name" {
  description = "Name of the contact job definition"
  type        = string
  default     = "snowflake_production_contact"
}

variable "contact_job_description" {
  description = "Description of the contact job definition"
  type        = string
  default     = "Contact data transfer job"
}

variable "contactnote_job_name" {
  description = "Name of the contactnote job definition"
  type        = string
  default     = "snowflake_production_contactnote"
}

variable "contactnote_job_description" {
  description = "Description of the contactnote job definition"
  type        = string
  default     = "Contact note transfer job"
}

variable "visit_job_name" {
  description = "Name of the visit job definition"
  type        = string
  default     = "snowflake_production_visit"
}

variable "visit_job_description" {
  description = "Description of the visit job definition"
  type        = string
  default     = "Visit data transfer job"
}

variable "warning_job_name" {
  description = "Name of the warning job definition"
  type        = string
  default     = "snowflake_production_warning"
}

variable "warning_job_description" {
  description = "Description of the warning job definition"
  type        = string
  default     = "Warning note transfer job"
}



variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "your-bucket-name"
}



