output "job_definition_id" {
  description = "The ID of the created contactnote job definition"
  value       = trocco_job_definition.contactnote_job.id
}

output "job_name" {
  description = "The name of the created contactnote job definition"
  value       = trocco_job_definition.contactnote_job.name
}