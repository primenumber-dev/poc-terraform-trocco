output "pipeline_definition_id" {
  description = "ID of the created pipeline definition"
  value       = trocco_pipeline_definition.pipeline.id
}

output "pipeline_name" {
  description = "Name of the pipeline definition"
  value       = trocco_pipeline_definition.pipeline.name
}