#################
# Ecs Backup Client
#################
variable "create_ecs_backup_client" {
  description = "Controls if ecs Backup Client should be created."
  type        = bool
  default     = false
}

variable "instance_id" {
  description = "(Required, ForceNew) The ID of ECS instance."
  type        = string
  default     = ""
}

variable "use_https" {
  description = "Indicates whether to use the HTTPS protocol. Valid values: true, false."
  type        = bool
  default     = false
}

variable "data_network_type" {
  description = "The data plane access point type. Valid values: CLASSIC, PUBLIC, VPC."
  type        = string
  default     = "VPC"

  validation {
    condition     = contains(["CLASSIC", "PUBLIC", "VPC"], var.data_network_type)
    error_message = "Allowed values is COMPLETE, PUBLIC or VPC."
  }
}

variable "max_cpu_core" {
  description = "The number of CPU cores used by a single backup task, 0 means no restrictions."
  type        = number
  default     = null
}

variable "max_worker" {
  description = "The number of concurrent jobs for a single backup task, 0 means no restrictions."
  type        = number
  default     = null
}

variable "data_proxy_setting" {
  description = "The data plane proxy settings. Valid values: CUSTOM, DISABLE, USE_CONTROL_PROXY."
  type        = string
  default     = "USE_CONTROL_PROXY"

  validation {
    condition     = contains(["CUSTOM", "DISABLE", "USE_CONTROL_PROXY"], var.data_proxy_setting)
    error_message = "Allowed values is CUSTOM, DISABLE or USE_CONTROL_PROXY."
  }
}

variable "proxy_host" {
  description = "Custom data plane proxy server host address."
  type        = string
  default     = ""
}

variable "proxy_port" {
  description = "Custom data plane proxy server host port."
  type        = number
  default     = null
}

variable "proxy_user" {
  description = "The username of custom data plane proxy server."
  type        = string
  default     = ""
}

variable "proxy_password" {
  description = "The password of custom data plane proxy server."
  type        = string
  default     = ""
}

#################
# Ecs Backup Plan
#################
variable "create_backup_plan" {
  description = "Controls if backup plan should be created"
  type        = bool
  default     = false
}

variable "name" {
  description = "(Required) The name of the backup plan. 1~64 characters, the backup plan name of each data source type in a single warehouse required to be unique."
  type        = string
  default     = ""
}

variable "vault_id" {
  description = "(Required, ForceNew) The ID of Backup vault."
  type        = string
  default     = ""
}

variable "schedule" {
  description = "(Required) Backup strategy. Optional format: I|{startTime}|{interval}. It means to execute a backup task every {interval} starting from {startTime}. The backup task for the elapsed time will not be compensated. If the last backup task has not completed yet, the next backup task will not be triggered.startTime Backup start time, UNIX time seconds.interval ISO8601 time interval. E.g: PT1H means one hour apart. P1D means one day apart."
  type        = string
  default     = ""
}

variable "retention" {
  description = "(Required) Backup retention days, the minimum is 1."
  type        = number
  default     = 1
}

variable "path" {
  description = "(Required) List of backup path. Up to 65536 characters. e.g.['/home', '/var']. Note If path is empty, it means that all directories will be backed up."
  type        = list(string)
  default     = []
}

variable "speed_limit" {
  description = "Flow control. The format is: {start}|{end}|{bandwidth}. Use | to separate multiple flow control configurations, multiple flow control configurations not allowed to have overlapping times. start:starting hour; end:end hour; bandwidth:limit rate, in KiB"
  type        = string
  default     = 1
}

variable "exclude" {
  description = "Exclude path. String of Json list, up to 255 characters. e.g. [\"/home/work\"]"
  type        = string
  default     = ""
}

variable "include" {
  description = "Include path. String of Json list, up to 255 characters. e.g. [\"/home/work\"]"
  type        = string
  default     = ""
}

#################
# Ecs Restore Job
#################
variable "create_restore_job" {
  description = "Controls if restore job should be created"
  type        = bool
  default     = false
}

variable "snapshot_hash" {
  description = "(Required while create_restore_job is true, ForceNew) The hashcode of Snapshot."
  type        = string
  default     = ""
}

variable "snapshot_id" {
  description = "(Required while create_restore_job is true, ForceNew) The ID of Snapshot."
  type        = string
  default     = ""
}

variable "target_instance_id" {
  description = "(Required while create_restore_job is true, ForceNew) The target ID of ECS instance."
  type        = string
  default     = ""
}

variable "target_path" {
  description = "(Required while create_restore_job is true, ForceNew) The target file path of (ECS) instance. WARNING: If this value filled in incorrectly, the task may not start correctly, so please check the parameters before executing the plan."
  type        = string
  default     = ""
}