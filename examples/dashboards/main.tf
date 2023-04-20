
module "dashboards" {
  source = "../../modules/dashboards"

  dashboard_sources_path = var.dashboard_sources_path
  gcp_project            = var.gcp_project
}
