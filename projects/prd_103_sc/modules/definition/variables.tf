variable "pipeline_name" {
  description = "Name of the pipeline definition"
  type        = string
}

variable "pipeline_description" {
  description = "Description of the pipeline definition"
  type        = string
  default     = "Data pipeline definition"
}

variable "max_task_parallelism" {
  description = "Maximum number of tasks that can run in parallel"
  type        = number
  default     = 4
}

variable "execution_timeout" {
  description = "Execution timeout in seconds (0 for no timeout)"
  type        = number
  default     = 0
}

variable "max_retries" {
  description = "Maximum number of retries"
  type        = number
  default     = 0
}

variable "min_retry_interval" {
  description = "Minimum retry interval in seconds"
  type        = number
  default     = 0
}

variable "is_concurrent_execution_skipped" {
  description = "Whether to skip concurrent executions"
  type        = bool
  default     = true
}

variable "is_stopped_on_errors" {
  description = "Whether to stop on errors"
  type        = bool
  default     = true
}

variable "schedules" {
  description = "Schedule configurations for the pipeline"
  type = list(object({
    frequency = string
    minute    = number
    hour      = number
    time_zone = string
  }))
  default = [
    {
      frequency = "daily"
      minute    = 30
      hour      = 1
      time_zone = "Asia/Tokyo"
    }
  ]
}

variable "notifications" {
  description = "Notification configurations for the pipeline"
  type = list(object({
    type             = string
    destination_type = string
    notify_when      = optional(string)
    time             = optional(number)
    email_config = object({
      notification_id = number
      message         = string
    })
  }))
  default = []
}

variable "tasks" {
  description = "Task definitions for the pipeline"
  type = list(object({
    key  = string
    type = string
    trocco_dbt_config = optional(object({
      definition_id = number
      name          = string
    }))
    trocco_transfer_config = optional(object({
      definition_id = number
      name          = string
    }))
  }))
  default = []
}

variable "task_dependencies" {
  description = "Task dependencies for the pipeline"
  type = list(object({
    source      = string
    destination = string
  }))
  default = []
}