data "alicloud_zones" "default" {
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_zones.default.zones.0.id
}

data "alicloud_images" "default" {
  name_regex = "^centos_6"
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = "tf-test-hbr-ecs"
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = "tf-test-hbr-ecs"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

module "security_group" {
  source = "alibaba/security-group/alicloud"
  vpc_id = module.vpc.this_vpc_id
}

resource "alicloud_instance" "default" {

  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = [module.security_group.this_security_group_id]
  instance_type     = data.alicloud_instance_types.default.instance_types.0.id
  image_id          = data.alicloud_images.default.images.0.id
  instance_name     = "tf-test-hbr-ecs"
  vswitch_id        = module.vpc.this_vswitch_ids[0]
}

resource "alicloud_hbr_vault" "default" {
  vault_name = "tf-test-hbr-ecs"
}

data "alicloud_hbr_snapshots" "nas_snapshots" {
  source_type = "ECS_FILE"
  vault_id    = alicloud_hbr_vault.default.id
  instance_id = alicloud_instance.default.id
}

module "example" {
  source = "../.."

  instance_id = alicloud_instance.default.id

  #alicloud_hbr_ecs_backup_client
  create_ecs_backup_client = true
  use_https                = var.use_https
  data_network_type        = var.data_network_type
  max_cpu_core             = var.max_cpu_core
  max_worker               = var.max_worker
  data_proxy_setting       = var.data_proxy_setting
  proxy_host               = var.proxy_host
  proxy_port               = var.proxy_port
  proxy_user               = var.proxy_user
  proxy_password           = var.proxy_password

  #alicloud_hbr_ecs_backup_plan
  create_backup_plan = true
  name               = var.name
  schedule           = var.schedule
  vault_id           = alicloud_hbr_vault.default.id
  retention          = var.retention
  path               = var.path
  speed_limit        = var.speed_limit
  exclude            = var.exclude
  include            = var.include

  #alicloud_hbr_restore_job
  create_restore_job = false
  snapshot_hash      = length(data.alicloud_hbr_snapshots.nas_snapshots.snapshots) > 0 ? data.alicloud_hbr_snapshots.nas_snapshots.snapshots.0.snapshot_hash : var.snapshot_hash
  snapshot_id        = length(data.alicloud_hbr_snapshots.nas_snapshots.snapshots) > 0 ? data.alicloud_hbr_snapshots.nas_snapshots.snapshots.0.snapshot_id : var.snapshot_id
  target_instance_id = alicloud_instance.default.id
  target_path        = var.target_path
}