
# Google Cloud Monitoring wrapper for component modules

module "alert_policies" {
  source     = "./modules/alert-policies"
  count      = var.enable_alert_policies && length(var.alert_policies) != 0 ? 1 : 0
  depends_on = [module.notification_channels, module.log_metrics, module.uptime_checks]
  # module.metric_descriptors

  gcp_project    = var.gcp_project
  alert_policies = var.alert_policies
}

module "dashboards" {
  source     = "./modules/dashboards"
  count      = var.enable_dashboards && var.dashboard_sources_path != "" ? 1 : 0
  depends_on = [module.log_metrics, module.uptime_checks]
  # module.metric_descriptors

  dashboard_sources_path = var.dashboard_sources_path
  gcp_project            = var.gcp_project
}

module "groups" {
  source = "./modules/groups"
  count  = var.enable_groups && length(var.groups) != 0 ? 1 : 0

  gcp_project = var.gcp_project
  groups      = var.groups
}

module "log_metrics" {
  source = "./modules/log-metrics"
  count  = var.enable_log_metrics && length(var.logging_metrics) != 0 ? 1 : 0

  gcp_project     = var.gcp_project
  logging_metrics = var.logging_metrics
}

module "logging" {
  source = "./modules/logging"
  count  = var.enable_logging && var.logging_bucket != "" ? 1 : 0

  logging_bucket    = var.logging_bucket
  logging_project   = var.gcp_project
  organization_name = var.organization_name
  organization_sink = var.organization_sink
}

module "metric_descriptors" {
  source = "./modules/metric-descriptors"
  count  = var.enable_metric_descriptors && length(var.metric_descriptors) != 0 ? 1 : 0

  metric_descriptors = var.metric_descriptors
}

module "notification_channels" {
  source = "./modules/notification-channels"
  count  = var.enable_notification_channels && length(var.notification_channels) != 0 ? 1 : 0

  gcp_project           = var.gcp_project
  notification_channels = var.notification_channels
}

module "project_scope" {
  source = "./modules/project-scope"
  count  = var.enable_project_scope && var.gcp_org_id != "" ? 1 : 0

  gcp_org_id = var.gcp_org_id
}

module "services" {
  source = "./modules/services"
  count  = var.enable_services && length(var.services) != 0 ? 1 : 0

  gcp_project     = var.gcp_project
  custom_services = var.custom_services
  services        = var.services
}

module "slo" {
  source = "./modules/slo"
  count  = var.enable_slo && length(var.slos) != 0 ? 1 : 0

  gcp_project = var.gcp_project
  slos        = var.slos
}

module "uptime_checks" {
  source = "./modules/uptime-checks"
  count  = var.enable_uptime_checks && length(var.uptime_checks) != 0 ? 1 : 0

  gcp_project   = var.gcp_project
  uptime_checks = var.uptime_checks
}
