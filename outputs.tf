output "backup_client_id" {
  description = "The ID of the backup client."
  value       = concat(alicloud_hbr_ecs_backup_client.backup_client[*].id, [""])[0]
}

output "backup_client_status" {
  description = "The status of the backup client."
  value       = concat(alicloud_hbr_ecs_backup_client.backup_client[*].status, [""])[0]
}

output "backup_plan_id" {
  description = "The ID of the backup plan."
  value       = concat(alicloud_hbr_ecs_backup_plan.backup_plan[*].id, [""])[0]
}

output "backup_plan_name" {
  description = "The name of the backup plan."
  value       = concat(alicloud_hbr_ecs_backup_plan.backup_plan[*].ecs_backup_plan_name, [""])[0]
}

output "instance_id" {
  description = "The ID of the instance."
  value       = concat(alicloud_hbr_ecs_backup_plan.backup_plan[*].instance_id, [""])[0]
}

output "backup_plan_schedule" {
  description = "The schedule of the backup plan."
  value       = concat(alicloud_hbr_ecs_backup_plan.backup_plan[*].schedule, [""])[0]
}

output "restore_job_id" {
  description = "The ID of the restore job."
  value       = concat(alicloud_hbr_restore_job.restore_job[*].id, [""])[0]
}



