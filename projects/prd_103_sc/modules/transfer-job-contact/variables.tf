variable "job_name" {
  description = "Name of the contact job definition"
  type        = string
  default     = "snowflake_production_contact"
}

variable "job_description" {
  description = "Description of the contact job definition"
  type        = string
  default     = "Contact note transfer job"
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

variable "snowflake_connection_id" {
  description = "Snowflake connection ID for output"
  type        = number
}

variable "input_columns" {
  description = "Input column definitions"
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
      name = "CST_MEMBERSID__C"
      type = "string"
    },
    {
      name = "CST_FIRSTPURCHASEDATE__C"
      type = "string"
    },
    {
      name = "CST_FREQUENCYOFSUITS__C"
      type = "string"
    },
    {
      name = "CST_CONCERNOFSUITS__C"
      type = "string"
    },
    {
      name = "CST_NUMBEROFSUITS__C"
      type = "double"
    },
    {
      name = "CST_SHOESPERSISTANCE__C"
      type = "double"
    },
    {
      name = "CST_FREQUENCYOFHEEL__C"
      type = "string"
    },
    {
      name = "CST_JOB__C"
      type = "string"
    },
    {
      name = "TITLE"
      type = "string"
    },
    {
      name = "CST_WORKPLACE__C"
      type = "string"
    },
    {
      name = "CST_HOBBY__C"
      type = "string"
    },
    {
      name = "CST_FAMILYSTRUCTURE__C"
      type = "string"
    },
    {
      name = "CST_ISWARNING__C"
      type = "string"
    }
  ]
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
  default     = "raw_cst_contact"
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
      name = "cst_membersid__c"
      type = "STRING"
    },
    {
      name = "cst_firstpurchasedate__c"
      type = "STRING"
    },
    {
      name = "cst_frequencyofsuits__c"
      type = "STRING"
    },
    {
      name = "cst_concernofsuits__c"
      type = "STRING"
    },
    {
      name = "cst_numberofsuits__c"
      type = "DOUBLE"
    },
    {
      name = "cst_shoespersistance__c"
      type = "DOUBLE"
    },
    {
      name = "cst_frequencyofheel__c"
      type = "STRING"
    },
    {
      name = "cst_job__c"
      type = "STRING"
    },
    {
      name = "title"
      type = "STRING"
    },
    {
      name = "cst_workplace__c"
      type = "STRING"
    },
    {
      name = "cst_hobby__c"
      type = "STRING"
    },
    {
      name = "cst_familystructure__c"
      type = "STRING"
    },
    {
      name = "cst_iswarning__c"
      type = "STRING"
    }
  ]
}

# SnowFlakeに転送する際、カラム名を小文字に変更
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
      name = "cst_membersid__c"
      src  = "CST_MEMBERSID__C"
      type = "string"
    },
    {
      name = "cst_firstpurchasedate__c"
      src  = "CST_FIRSTPURCHASEDATE__C"
      type = "string"
    },
    {
      name = "cst_frequencyofsuits__c"
      src  = "CST_FREQUENCYOFSUITS__C"
      type = "string"
    },
    {
      name = "cst_concernofsuits__c"
      src  = "CST_CONCERNOFSUITS__C"
      type = "string"
    },
    {
      name = "cst_numberofsuits__c"
      src  = "CST_NUMBEROFSUITS__C"
      type = "double"
    },
    {
      name = "cst_shoespersistance__c"
      src  = "CST_SHOESPERSISTANCE__C"
      type = "double"
    },
    {
      name = "cst_frequencyofheel__c"
      src  = "CST_FREQUENCYOFHEEL__C"
      type = "string"
    },
    {
      name = "cst_job__c"
      src  = "CST_JOB__C"
      type = "string"
    },
    {
      name = "title"
      src  = "TITLE"
      type = "string"
    },
    {
      name = "cst_workplace__c"
      src  = "CST_WORKPLACE__C"
      type = "string"
    },
    {
      name = "cst_hobby__c"
      src  = "CST_HOBBY__C"
      type = "string"
    },
    {
      name = "cst_familystructure__c"
      src  = "CST_FAMILYSTRUCTURE__C"
      type = "string"
    },
    {
      name = "cst_iswarning__c"
      src  = "CST_ISWARNING__C"
      type = "string"
    }
  ]
}