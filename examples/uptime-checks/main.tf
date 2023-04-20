
module "uptime_checks" {
  source = "../../modules/uptime-checks"

  gcp_project   = ""
  uptime_checks = []
}
