Terraform module which creates Hybrid Backup Recovery (HBR) for ECS on Alibaba Cloud.

terraform-alicloud-hbr-ecs
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbr-ecs/blob/main/README-CN.md)

This module is used to create Hybrid Backup Recovery (HBR) for ECS on Alibaba Cloud.

These types of resources are supported:

* [alicloud_hbr_ecs_backup_client](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/hbr_ecs_backup_client)
* [alicloud_hbr_ecs_backup_plan](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/hbr_ecs_backup_plan)
* [alicloud_hbr_restore_job](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/hbr_restore_job)

## Usage

```hcl
module "example" {
  source                   = "terraform-alicloud-modules/hbr-ecs/alicloud"
  #alicloud_hbr_ecs_backup_client
  create_ecs_backup_client = true
  instance_id              = "i-abc12345"
  use_https                = false
  data_network_type        = "VPC"
  max_cpu_core             = 2
  max_worker               = 4
  data_proxy_setting       = "USE_CONTROL_PROXY"
  proxy_host               = "192.168.11.101"
  proxy_port               = 80
  proxy_user               = "user"
  proxy_password           = "password"
  #alicloud_hbr_ecs_backup_plan
  create_backup_plan       = true
  name                     = "tf-test-hbr-nas"
  schedule                 = "I|1646827682|PT2H"
  backup_type              = "COMPLETE"
  vault_id                 = "v-0006******q"
  retention                = 1
  path                     = ["/home", "/var"]
  speed_limit              = "0:24:5120"
  exclude                  = "[\"/home/exclude\"]"
  include                  = "[\"/home/include\"]"
  #alicloud_hbr_restore_job
  create_restore_job       = false
}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbr-ecs/tree/main/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.133.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.133.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)

