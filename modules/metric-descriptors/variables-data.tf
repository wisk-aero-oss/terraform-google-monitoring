variable "metric_descriptors" {
  description = "List of Metric Dedscriptor configuration objects"
  type = list(object({
    description  = string
    display_name = string
    labels = optional(object({
      description = optional(string)
      key         = string
      value_type  = optional(string) # validate
    }))
    launch_stage = optional(string) # validate
    metadata = optional(object({
      ingest_delay  = optional(string)
      sample_period = optional(string)
    }))
    metric_kind = string # validate
    type        = string
    unit        = optional(string)
    value_type  = string # validate
  }))
  default = [{
    description  = ""
    display_name = ""
    metric_kind  = ""
    type         = ""
    value_type   = ""
  }]
}
