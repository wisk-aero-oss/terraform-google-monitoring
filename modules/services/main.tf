
# May need to different variables or
#   add a field to select if custom or not

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_service
resource "google_monitoring_service" "self" {
  for_each     = { for service in var.services : service.display_name => service }
  display_name = each.value.display_name
  project      = var.gcp_project
  service_id   = each.value.service_id
  user_labels  = each.value.user_labels
  #dynamic "basic_service" {}
}

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_custom_service
resource "google_monitoring_custom_service" "self" {
  for_each     = { for service in var.custom_services : service.display_name => service }
  display_name = each.value.display_name
  project      = var.gcp_project
  service_id   = each.value.service_id
  user_labels  = each.value.user_labels
  #dynamic "telemetry" {}
}
