resource "trocco_job_definition" "visit_job" {
  name                     = var.job_name
  description              = var.job_description
  resource_group_id        = var.resource_group_id
  is_runnable_concurrently = var.is_runnable_concurrently
  retry_limit              = var.retry_limit

  # 転送元設定
  input_option_type = "s3"

  input_option = {
    s3_input_option = {
      bucket                      = var.s3_bucket
      s3_connection_id            = var.s3_connection_id
      path_prefix                 = var.s3_path_prefix
      region                      = var.s3_region
      incremental_loading_enabled = var.incremental_loading_enabled
      stop_when_file_not_found    = var.stop_when_file_not_found
      csv_parser = {
        charset                = "UTF-8"
        delimiter              = ","
        skip_header_lines      = 1
        columns                = var.input_columns
        allow_extra_columns    = false
        allow_optional_columns = false
        default_time_zone      = "UTC"
        stop_on_invalid_record = true
      }
    }
  }

  # 転送先設定
  output_option_type = "snowflake"

  output_option = {
    snowflake_output_option = {
      warehouse                              = var.output_warehouse
      database                               = var.output_database
      schema                                 = var.output_schema
      table                                  = var.output_table
      mode                                   = var.output_mode
      empty_field_as_null                    = var.empty_field_as_null
      delete_stage_on_error                  = var.delete_stage_on_error
      batch_size                             = var.batch_size
      retry_limit                            = var.output_retry_limit
      retry_wait                             = var.retry_wait
      max_retry_wait                         = var.max_retry_wait
      default_time_zone                      = var.default_time_zone
      snowflake_connection_id                = var.snowflake_connection_id
      snowflake_output_option_column_options = var.output_columns
    }
  }

  # フィルター設定
  filter_columns = var.filter_columns

  # 時刻追加フィルター
  filter_add_time = {
    column_name = "time"
    type        = "timestamp"
  }
}