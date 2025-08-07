output "job_definition_id" {
  description = "The ID of the created warning job definition"
  value       = trocco_job_definition.warning_job.id
}

output "job_name" {
  description = "The name of the created warning job definition"
  value       = trocco_job_definition.warning_job.name
}