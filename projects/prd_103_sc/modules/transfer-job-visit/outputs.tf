output "job_definition_id" {
  description = "The ID of the created visit job definition"
  value       = trocco_job_definition.visit_job.id
}

output "job_name" {
  description = "The name of the created visit job definition"
  value       = trocco_job_definition.visit_job.name
}