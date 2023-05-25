
variable "logging_metrics" {
  description = "List of logging metric configuration objects"
  type = list(object({
    name        = string
    bucket_name = optional(string)
    bucket_options = optional(object({
      explicit_buckets = optional(object({
        bounds = string
      }))
      exponential_buckets = optional(object({
        growth_factor      = optional(number)
        num_finite_buckets = optional(number)
        scale              = optional(number)
      }))
      linear_buckets = optional(object({
        num_finite_buckets = optional(number)
        offset             = optional(string)
        width              = optional(number)
      }))
    }))
    description      = optional(string)
    filter           = string
    label_extractors = optional(map(string))
    metric_descriptor = optional(object({
      description  = optional(string) # Not supported
      display_name = optional(string)
      labels = optional(list(object({
        description = optional(string)
        key         = string
        value_type  = optional(string)
      })))
      metric_kind = string           # validate
      type        = string           # Not supported
      unit        = optional(string) # validate
      value_type  = string           # validate
    }))
    value_extractor = optional(string)
  }))
  default = [{
    name   = ""
    filter = ""
  }]
}
