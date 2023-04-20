
module "alert-policies" {
  source = "../../modules/alert-policies"

  gcp_project    = ""
  alert_policies = []
}
