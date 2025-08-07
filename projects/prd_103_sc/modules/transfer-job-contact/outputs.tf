output "job_definition_id" {
  description = "The ID of the created contact job definition"
  value       = trocco_job_definition.contact_job.id
}

output "job_name" {
  description = "The name of the created contact job definition"
  value       = trocco_job_definition.contact_job.name
}