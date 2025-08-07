
output "contact_job_id" {
  description = "The ID of the created contact job definition"
  value       = module.contact_job.job_definition_id
}

output "contactnote_job_id" {
  description = "The ID of the created contactnote job definition"
  value       = module.contactnote_job.job_definition_id
}

output "visit_job_id" {
  description = "The ID of the created visit job definition"
  value       = module.visit_job.job_definition_id
}

output "warning_job_id" {
  description = "The ID of the created warning job definition"
  value       = module.warning_job.job_definition_id
}

output "pipeline_id" {
  description = "The ID of the created pipeline definition"
  value       = module.definition.pipeline_definition_id
}