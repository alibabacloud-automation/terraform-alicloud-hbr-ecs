output "backup_client_id" {
  description = "The ID of the backup client."
  value       = module.example.backup_client_id
}

output "backup_client_status" {
  description = "The status of the backup client."
  value       = module.example.backup_client_status
}

output "backup_plan_id" {
  description = "The ID of the backup plan."
  value       = module.example.backup_plan_id
}

output "backup_plan_name" {
  description = "The name of the backup plan."
  value       = module.example.backup_plan_name
}

output "instance_id" {
  description = "The ID of the instance."
  value       = module.example.instance_id
}

output "backup_plan_schedule" {
  description = "The schedule of the backup plan."
  value       = module.example.backup_plan_schedule
}

output "restore_job_id" {
  description = "The ID of the restore job."
  value       = module.example.restore_job_id
}
