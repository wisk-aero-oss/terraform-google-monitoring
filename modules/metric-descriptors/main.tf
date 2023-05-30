
# Get custom metrics. Look up how to get and recreate

# https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.metricDescriptors/list
#   Get all - not just custom
# filter custom.googleapis.com
# https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.metricDescriptors/list?apix_params=%7B%22filter%22%3A%22metric.type%20%3D%20starts_with(%5C%22custom.googleapis.com%2F%5C%22)%22%7D

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_metric_descriptor
resource "google_monitoring_metric_descriptor" "self" {
  for_each     = { for metric in var.metric_descriptors : metric.display_name => metric }
  description  = each.value.description
  display_name = each.value.display_name
  launch_stage = each.value.launch_stage
  metric_kind  = each.value.metric_kind
  project      = var.gcp_project
  type         = each.value.type
  unit         = each.value.unit
  value_type   = each.value.value_type
  dynamic "labels" { # TODO: optional, multiple (list) ?
    for_each = each.value.labels
    content {
      description = labels.value.description
      key         = labels.value.key
      value_type  = labels.value.value_type
    }
  }
  dynamic "metadata" { # TODO: optional, multiple (list) ?
    for_each = each.value.metadata
    content {
      ingest_delay  = metadata.value.ingest_delay
      sample_period = metadata.value.sample_period
    }
  }
}
