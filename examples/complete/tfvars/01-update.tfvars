#alicloud_hbr_ecs_backup_client
use_https          = true
data_network_type  = "PUBLIC"
max_cpu_core       = 3
max_worker         = 3
data_proxy_setting = "CUSTOM"
proxy_host         = "192.168.11.100"
proxy_port         = 8080
proxy_user         = "updateuser"
proxy_password     = "updatepassword"
#alicloud_hbr_nas_backup_plan
name        = "tf-update-test-hbr-ecs"
retention   = 2
schedule    = "I|1646917983|PT2H"
path        = []
speed_limit = "0:24:5130"