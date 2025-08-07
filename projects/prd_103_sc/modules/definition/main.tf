resource "trocco_pipeline_definition" "pipeline" {
  name                            = var.pipeline_name
  description                     = var.pipeline_description
  max_task_parallelism            = var.max_task_parallelism
  execution_timeout               = var.execution_timeout
  max_retries                     = var.max_retries
  min_retry_interval              = var.min_retry_interval
  is_concurrent_execution_skipped = var.is_concurrent_execution_skipped
  is_stopped_on_errors            = var.is_stopped_on_errors

  # スケジュール設定
  schedules = var.schedules

  # 通知設定
  notifications = var.notifications

  # タスク定義
  tasks = var.tasks

  # タスク依存関係
  task_dependencies = var.task_dependencies
}