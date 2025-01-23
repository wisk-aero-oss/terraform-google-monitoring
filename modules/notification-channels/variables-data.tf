
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel
variable "notification_channels" {
  description = "Notification channel configuration objects"
  type = list(object({
    description  = string
    display_name = string
    enabled      = bool
    labels       = optional(map(string))
    sensitive_labels = optional(object({
      auth_token  = optional(string)
      password    = optional(string)
      service_key = optional(string)
    }))
    user_labels = optional(map(string))
    type        = string
  }))
  validation {
    condition = alltrue(flatten([
      for channel in var.notification_channels :
      contains(["email", "pagerduty", "slack", "sms", "webhook_tokenauth"],
    channel.type)]))
    error_message = "Allowed values for type: email, pagerduty, slack, sms"
  }
  validation {
    condition = alltrue([
      for channel in var.notification_channels :
      length(setintersection(
        keys(channel.labels == null ? {} : channel.labels),
        keys(channel.sensitive_labels == null ? {} : channel.sensitive_labels)
      )) == 0
    ])
    error_message = "Same label can not be defined in both labels and sensitive_labels"
  }
  #validation { # sensitive_labels is right format for GCP secret lookup ??
  #}
  default = [{
    description  = ""
    display_name = ""
    enabled      = false
    type         = "sms"
  }]
}
