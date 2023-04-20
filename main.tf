
# Google Cloud Monitoring wrapper for component modules

module "alert_policies" {
  source = "./modules/alert-policies"
  count  = var.enable_alert_policies && length(var.alert_policies) != 0 ? 1 : 0

  gcp_project    = var.gcp_project
  alert_policies = var.alert_policies
}

module "dashboards" {
  source = "./modules/dashboards"
  count  = var.enable_dashboards && var.dashboard_sources_path != "" ? 1 : 0

  dashboard_sources_path = var.dashboard_sources_path
  gcp_project            = var.gcp_project
}

module "groups" {
  source = "./modules/groups"
  count  = var.enable_groups && length(var.groups) != 0 ? 1 : 0

  gcp_project = var.gcp_project
  groups      = []
}

module "log_metrics" {
  source = "./modules/log-metrics"
  count  = var.enable_log_metrics && length(var.logging_metrics) != 0 ? 1 : 0

  gcp_project     = var.gcp_project
  logging_metrics = []
}

module "notification_channels" {
  source = "./modules/notification-channels"
  count  = var.enable_notification_channels && length(var.notification_channels) != 0 ? 1 : 0

  gcp_project           = var.gcp_project
  notification_channels = []
}

module "project_scope" {
  source = "./modules/project-scope"
  count  = var.enable_project_scope && var.gcp_org_id != "" ? 1 : 0

  gcp_org_id = var.gcp_org_id
}

module "uptime_checks" {
  source = "./modules/uptime-checks"
  count  = var.enable_uptime_checks && length(var.uptime_checks) != 0 ? 1 : 0

  gcp_project   = var.gcp_project
  uptime_checks = []
}
