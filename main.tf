resource "alicloud_hbr_ecs_backup_client" "backup_client" {
  count              = var.create_ecs_backup_client ? 1 : 0
  instance_id        = var.instance_id
  use_https          = var.use_https
  data_network_type  = var.data_network_type
  max_cpu_core       = var.max_cpu_core
  max_worker         = var.max_worker
  data_proxy_setting = var.data_proxy_setting
  proxy_host         = var.proxy_host
  proxy_port         = var.proxy_port
  proxy_user         = var.proxy_user
  proxy_password     = var.proxy_password
}

resource "alicloud_hbr_ecs_backup_plan" "backup_plan" {
  count                = var.create_backup_plan ? 1 : 0
  depends_on           = [alicloud_hbr_ecs_backup_client.backup_client]
  ecs_backup_plan_name = var.name
  instance_id          = var.instance_id
  schedule             = var.schedule
  backup_type          = "COMPLETE"
  vault_id             = var.vault_id
  retention            = var.retention
  path                 = var.path
  speed_limit          = var.speed_limit
  exclude              = var.exclude
  include              = var.include
}

resource "alicloud_hbr_restore_job" "restore_job" {
  count              = var.create_restore_job ? 1 : 0
  snapshot_hash      = var.snapshot_hash
  vault_id           = var.vault_id
  source_type        = "ECS_FILE"
  restore_type       = "ECS_FILE"
  snapshot_id        = var.snapshot_id
  target_instance_id = var.target_instance_id
  target_path        = var.target_path
}

