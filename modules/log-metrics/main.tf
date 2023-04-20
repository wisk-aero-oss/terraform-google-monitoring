

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric

resource "google_logging_metric" "self" {
  for_each         = { for metric in var.logging_metrics : metric.name => metric }
  bucket_name      = each.value.bucket_name
  description      = each.value.description
  filter           = each.value.filter
  label_extractors = each.value.label_extractors
  name             = each.value.name
  project          = var.gcp_project
  dynamic "bucket_options" {
    for_each = try(each.value["bucket_options"], null) == null ? [] : [each.value["bucket_options"]]
    content {
      dynamic "explicit_buckets" {
        for_each = try(bucket_options.value.explicit_buckets, null) == null ? [] : [bucket_options.value.explicit_buckets]
        content {
          bounds = explicit_buckets.value.bounds
        }
      }
      dynamic "exponential_buckets" {
        for_each = try(bucket_options.value.exponential_buckets, null) == null ? [] : [bucket_options.value.exponential_buckets]
        content {
          growth_factor      = exponential_buckets.value.growth_factor
          num_finite_buckets = exponential_buckets.value.num_finite_buckets
          scale              = exponential_buckets.value.scale
        }
      }
      dynamic "linear_buckets" {
        for_each = try(bucket_options.value.linear_buckets, null) == null ? [] : [bucket_options.value.linear_buckets]
        content {
          num_finite_buckets = linear_buckets.value.num_finite_buckets
          offset             = linear_buckets.value.offset
          width              = linear_buckets.value.width
        }
      }
    }
  }
  dynamic "metric_descriptor" {
    for_each = try(each.value.metric_descriptor, null) == null ? [] : [each.value.metric_descriptor]
    content {
      #description = metric_descriptor.value.description
      display_name = metric_descriptor.value.display_name
      dynamic "labels" {
        for_each = try(metric_descriptor.value.labels, null) == null ? [] : metric_descriptor.value.labels
        content {
          description = labels.value.description
          key         = labels.value.key
          value_type  = labels.value.value_type
        }
      }
      metric_kind = metric_descriptor.value.metric_kind
      #type = metric_descriptor.value.type
      unit       = metric_descriptor.value.unit
      value_type = metric_descriptor.value.value_type
    }
  }
  value_extractor = each.value.value_extractor
}
