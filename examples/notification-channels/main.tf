
module "notification_channels" {
  source = "../../modules/notification-channels"

  gcp_project           = ""
  notification_channels = []
}
