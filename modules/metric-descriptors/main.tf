
# Get custom metrics. Look up how to get and recreate


#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_metric_descriptor
resource "google_monitoring_metric_descriptor" "self" {
  for_each     = { for metric in var.metric_descriptors : metric.display_name => metric }
  description  = each.value.description
  display_name = each.value.display_name
  launch_stage = each.value.launch_stage
  metric_kind  = each.value.metric_kind
  type         = each.value.type
  unit         = each.value.unit
  value_type   = each.value.value_type
  #dynamic "labels" {
  #
  #}
  #dynamic "metadata" {
  #
  #}
}
