provider "trocco" {
  region  = "japan"
  api_key = var.trocco_api_key
}


# S3 to Snowflake transfer job (Contact)
module "contact_job" {
  source = "./modules/transfer-job-contact"

  job_name                = var.contact_job_name
  job_description         = var.contact_job_description
  s3_connection_id        = data.terraform_remote_state.connection_setup.outputs.s3_connection_id
  snowflake_connection_id = data.terraform_remote_state.connection_setup.outputs.snowflake_connection_id
  s3_bucket               = var.s3_bucket_name
  s3_path_prefix          = "prd_103_sc/contact.csv"
  output_table            = "raw_contact"
}

# S3 to Snowflake transfer job (Contactnote)
module "contactnote_job" {
  source = "./modules/transfer-job-contactnote"

  job_name                = var.contactnote_job_name
  job_description         = var.contactnote_job_description
  s3_connection_id        = data.terraform_remote_state.connection_setup.outputs.s3_connection_id
  snowflake_connection_id = data.terraform_remote_state.connection_setup.outputs.snowflake_connection_id
  s3_bucket               = var.s3_bucket_name
  s3_path_prefix          = "prd_103_sc/cst_contactnote__c.csv"
  output_table            = "raw_cst_contactnote__c"
}

# S3 to Snowflake transfer job (Visit)
module "visit_job" {
  source = "./modules/transfer-job-visit"

  job_name                = var.visit_job_name
  job_description         = var.visit_job_description
  s3_connection_id        = data.terraform_remote_state.connection_setup.outputs.s3_connection_id
  snowflake_connection_id = data.terraform_remote_state.connection_setup.outputs.snowflake_connection_id
  s3_bucket               = var.s3_bucket_name
  s3_path_prefix          = "prd_103_sc/cst_visit__c.csv"
  output_table            = "raw_cst_visit__c"
}

# S3 to Snowflake transfer job (Warning)
module "warning_job" {
  source = "./modules/transfer-job-warning"

  job_name                = var.warning_job_name
  job_description         = var.warning_job_description
  s3_connection_id        = data.terraform_remote_state.connection_setup.outputs.s3_connection_id
  snowflake_connection_id = data.terraform_remote_state.connection_setup.outputs.snowflake_connection_id
  s3_bucket               = var.s3_bucket_name
  s3_path_prefix          = "prd_103_sc/cst_warningnote__c.csv"
  output_table            = "raw_cst_warningnote__c"
}

# Pipeline definition module
module "definition" {
  source = "./modules/definition"

  pipeline_name        = "【prd_103_sc】wf_1300"
  pipeline_description = "Production SC workflow 1300 pipeline"

  # Note: notification_ids should be set after running notification-setup project
  # Run: cd ../notification-setup && terraform apply
  # Then update these IDs with the output values
  notifications = [
    {
      type             = "job_execution"
      destination_type = "email"
      notify_when      = "failed"
      email_config = {
        notification_id = 2291
        message         = "成功したワークフロータスク一覧 ：$SUCCEEDED_TASK_NAMES$\n失敗したワークフロータスク一覧 ：$ERROR_TASK_NAMES$"
      }
    },
    
    {
      type             = "job_time_alert"
      destination_type = "email"
      time             = 30
      email_config = {
        notification_id = 2291
        message         = "ワークフローの実行時間が30分を超過しました"
      }
    },
    {
      type             = "job_execution"
      destination_type = "email"
      notify_when      = "failed"
      email_config = {
        notification_id = 2292
        message         = "成功したワークフロータスク一覧 ：$SUCCEEDED_TASK_NAMES$\n失敗したワークフロータスク一覧 ：$ERROR_TASK_NAMES$"
      }
    },
    {
      type             = "job_time_alert"
      destination_type = "email"
      time             = 30
      email_config = {
        notification_id = 2292
        message         = "ワークフローの実行時間が30分を超過しました"
      }
    }
  ]

  task_dependencies = [
    {
      source      = "t1"
      destination = "t5"
    },
    {
      source      = "t2"
      destination = "t5"
    },
    {
      source      = "t3"
      destination = "t5"
    },
    {
      source      = "t4"
      destination = "t5"
    }
  ]

  tasks = [
    {
      key             = "t1"
      task_identifier = 1
      type            = "trocco_transfer"
      trocco_transfer_config = {
        definition_id = module.contact_job.job_definition_id
        name          = module.contact_job.job_name
      }
    },
    {
      key             = "t2"
      task_identifier = 2
      type            = "trocco_transfer"
      trocco_transfer_config = {
        definition_id = module.contactnote_job.job_definition_id
        name          = module.contactnote_job.job_name
      }
    },
    {
      key             = "t3"
      task_identifier = 3
      type            = "trocco_transfer"
      trocco_transfer_config = {
        definition_id = module.visit_job.job_definition_id
        name          = module.visit_job.job_name
      }
    },
    {
      key             = "t4"
      task_identifier = 4
      type            = "trocco_transfer"
      trocco_transfer_config = {
        definition_id = module.warning_job.job_definition_id
        name          = module.warning_job.job_name
      }
    },
    {
      key             = "t5"
      task_identifier = 5
      type            = "trocco_dbt"
      trocco_dbt_config = {
        definition_id = 949
        name          = "test-dbt-pipeline"
      }
    }
  ]
}