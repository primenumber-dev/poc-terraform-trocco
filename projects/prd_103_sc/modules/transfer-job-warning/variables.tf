variable "job_name" {
  description = "Name of the warning job definition"
  type        = string
  default     = "snowflake_production_warning"
}

variable "job_description" {
  description = "Description of the warning job definition"
  type        = string
  default     = "Warning note transfer job"
}

variable "resource_group_id" {
  description = "Resource group ID"
  type        = number
  default     = null
}

variable "is_runnable_concurrently" {
  description = "Whether the job can run concurrently"
  type        = bool
  default     = true
}

variable "retry_limit" {
  description = "Retry limit for the job"
  type        = number
  default     = 0
}

variable "s3_connection_id" {
  description = "S3 connection ID"
  type        = number
}

variable "s3_bucket" {
  description = "S3 bucket name"
  type        = string
}

variable "s3_path_prefix" {
  description = "S3 path prefix for files"
  type        = string
  default     = ""
}

variable "s3_region" {
  description = "S3 region"
  type        = string
  default     = "ap-northeast-1"
}

variable "incremental_loading_enabled" {
  description = "Enable incremental loading"
  type        = bool
  default     = false
}

variable "stop_when_file_not_found" {
  description = "Stop when file not found"
  type        = bool
  default     = false
}

variable "input_columns" {
  description = "Input column definitions for S3 CSV parser"
  type = list(object({
    name = string
    type = string
  }))
  default = [
    {
      name = "ID"
      type = "string"
    },
    {
      name = "MEMBERSID__C"
      type = "string"
    },
    {
      name = "NOTE__C"
      type = "string"
    }
  ]
}

variable "snowflake_connection_id" {
  description = "Snowflake connection ID for output"
  type        = number
}

variable "output_warehouse" {
  description = "Output Snowflake warehouse"
  type        = string
  default     = "COMPUTE_WH"
}

variable "output_database" {
  description = "Output Snowflake database"
  type        = string
  default     = "ONWARD_SANDBOX_DB"
}

variable "output_schema" {
  description = "Output Snowflake schema"
  type        = string
  default     = "RAW"
}

variable "output_table" {
  description = "Output table name"
  type        = string
  default     = "raw_cst_warningnote__c"
}

variable "output_mode" {
  description = "Output mode (insert, replace, etc.)"
  type        = string
  default     = "insert"
}

variable "empty_field_as_null" {
  description = "Treat empty fields as null"
  type        = bool
  default     = true
}

variable "delete_stage_on_error" {
  description = "Delete stage files on error"
  type        = bool
  default     = true
}

variable "batch_size" {
  description = "Batch size for processing"
  type        = number
  default     = 50
}

variable "output_retry_limit" {
  description = "Retry limit for output operations"
  type        = number
  default     = 12
}

variable "retry_wait" {
  description = "Initial retry wait time in milliseconds"
  type        = number
  default     = 1000
}

variable "max_retry_wait" {
  description = "Maximum retry wait time in milliseconds"
  type        = number
  default     = 1800000
}

variable "default_time_zone" {
  description = "Default time zone"
  type        = string
  default     = "JST"
}

variable "output_columns" {
  description = "Output column definitions"
  type = list(object({
    name = string
    type = string
  }))
  default = [
    {
      name = "id"
      type = "STRING"
    },
    {
      name = "membersid__c"
      type = "STRING"
    },
    {
      name = "note__c"
      type = "STRING"
    }
  ]
}

# Snowflakeに転送する際、カラム名を小文字に変更
variable "filter_columns" {
  description = "Filter column mappings"
  type = list(object({
    name = string
    src  = string
    type = string
  }))
  default = [
    {
      name = "id"
      src  = "ID"
      type = "string"
    },
    {
      name = "membersid__c"
      src  = "MEMBERSID__C"
      type = "string"
    },
    {
      name = "note__c"
      src  = "NOTE__C"
      type = "string"
    }
  ]
}