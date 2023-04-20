
module "log-metrics" {
  source = "../../modules/log-metrics"

  gcp_project     = ""
  logging_metrics = []
}
