output "backup_client_id" {
  value = concat(alicloud_hbr_ecs_backup_client.backup_client.*.id, [""])[0]
}

output "backup_client_status" {
  value = concat(alicloud_hbr_ecs_backup_client.backup_client.*.status, [""])[0]
}

output "backup_plan_id" {
  value = concat(alicloud_hbr_ecs_backup_plan.backup_plan.*.id, [""])[0]
}

output "backup_plan_name" {
  value = concat(alicloud_hbr_ecs_backup_plan.backup_plan.*.ecs_backup_plan_name, [""])[0]
}

output "instance_id" {
  value = concat(alicloud_hbr_ecs_backup_plan.backup_plan.*.instance_id, [""])[0]
}

output "backup_plan_schedule" {
  value = concat(alicloud_hbr_ecs_backup_plan.backup_plan.*.schedule, [""])[0]
}

output "restore_job_id" {
  value = concat(alicloud_hbr_restore_job.restore_job.*.id, [""])[0]
}



