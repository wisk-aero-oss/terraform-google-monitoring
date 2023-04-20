# terraform-google-module-template

[![Releases](https://img.shields.io/github/v/release/notablehealth/terraform-google-monitoring)](https://github.com/notablehealth/terraform-google-monitoring/releases)

[Terraform Module Registry](https://registry.terraform.io/modules/notablehealth/monitoring/google)

Module for managing Google Cloud Monitoring

## Features

-

## Usage



```hcl
module "monitoring" {
  source  = "notablehealth/monitoring/google"
  # Recommend pinning every module to a specific version
  # version = "x.x.x"

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alert_policies"></a> [alert\_policies](#module\_alert\_policies) | ./modules/alert-policies | n/a |
| <a name="module_dashboards"></a> [dashboards](#module\_dashboards) | ./modules/dashboards | n/a |
| <a name="module_groups"></a> [groups](#module\_groups) | ./modules/groups | n/a |
| <a name="module_log_metrics"></a> [log\_metrics](#module\_log\_metrics) | ./modules/log-metrics | n/a |
| <a name="module_notification_channels"></a> [notification\_channels](#module\_notification\_channels) | ./modules/notification-channels | n/a |
| <a name="module_project_scope"></a> [project\_scope](#module\_project\_scope) | ./modules/project-scope | n/a |
| <a name="module_uptime_checks"></a> [uptime\_checks](#module\_uptime\_checks) | ./modules/uptime-checks | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_policies"></a> [alert\_policies](#input\_alert\_policies) | Alert policy configuration objects | <pre>list(object({<br>    alert_strategy = optional(object({<br>      notification_rate_limit = optional(object({<br>        period = optional(number)<br>      }))<br>      auto_close = optional(string)<br>    }))<br>    combiner = string<br>    conditions = list(object({<br>      condition_absent = optional(object({<br>        aggregations = list(object({<br>          alignment_period     = optional(string)<br>          cross_series_reducer = optional(string) # validate<br>          group_by_fields      = optional(string) # ??<br>          per_series_aligner   = optional(string) # validate<br>        }))<br>        duration = string # Valid: minutes in seconds: must be /60<br>        filter   = optional(string)<br>        trigger = optional(object({<br>          count   = optional(number)<br>          percent = optional(number)<br>        }))<br>      }))<br>      condition_matched_log = optional(object({<br>        filter           = optional(string)<br>        label_extractors = optional(map(string))<br>      }))<br>      condition_monitoring_query_language = optional(object({<br>        duration                = string<br>        evaluation_missing_data = optional(string) # validate<br>        query                   = string<br>        trigger = optional(object({<br>          count   = optional(number)<br>          percent = optional(number)<br>        }))<br>      }))<br>      condition_threshold = optional(object({<br>        aggregations = optional(list(object({<br>          alignment_period     = optional(string)       # validate<br>          cross_series_reducer = optional(string)       # validate<br>          group_by_fields      = optional(list(string)) # ??<br>          per_series_aligner   = optional(string)       # validate<br>        })))<br>        comparison = string # validate [COMPARISON_GT COMPARISON_GE COMPARISON_LT COMPARISON_LE COMPARISON_EQ COMPARISON_NE]<br>        denominator_aggregations = optional(object({<br>          alignment_period     = optional(string)<br>          cross_series_reducer = optional(string) # validate<br>          group_by_fields      = optional(string) # ??<br>          per_series_aligner   = optional(string) # validate<br>        }))<br>        denominator_filter      = optional(string)<br>        duration                = string<br>        evaluation_missing_data = optional(string) # validate<br>        filter                  = optional(string)<br>        threshold_value         = optional(number)<br>        trigger = optional(object({<br>          count   = optional(number)<br>          percent = optional(number)<br>        }))<br>      }))<br>      display_name = string<br>    }))<br>    display_name = string<br>    documentation = object({<br>      content   = string<br>      mime_type = optional(string, "text/markdown")<br>    })<br>    enabled               = optional(bool, true)<br>    notification_channels = optional(list(string), [])<br>    user_labels           = optional(map(string))<br>  }))</pre> | <pre>[<br>  {<br>    "combiner": "",<br>    "conditions": [<br>      {<br>        "display_name": ""<br>      }<br>    ],<br>    "display_name": "",<br>    "documentation": {<br>      "content": ""<br>    }<br>  }<br>]</pre> | no |
| <a name="input_dashboard_sources_path"></a> [dashboard\_sources\_path](#input\_dashboard\_sources\_path) | Path to process dashboard source files | `string` | n/a | yes |
| <a name="input_enable_alert_policies"></a> [enable\_alert\_policies](#input\_enable\_alert\_policies) | Enable Alert Polices | `bool` | `false` | no |
| <a name="input_enable_dashboards"></a> [enable\_dashboards](#input\_enable\_dashboards) | Enable Dashboards | `bool` | `false` | no |
| <a name="input_enable_groups"></a> [enable\_groups](#input\_enable\_groups) | Enable Groups | `bool` | `false` | no |
| <a name="input_enable_log_metrics"></a> [enable\_log\_metrics](#input\_enable\_log\_metrics) | Enable Log Metrics | `bool` | `false` | no |
| <a name="input_enable_notification_channels"></a> [enable\_notification\_channels](#input\_enable\_notification\_channels) | Enable Notification Channels | `bool` | `false` | no |
| <a name="input_enable_project_scope"></a> [enable\_project\_scope](#input\_enable\_project\_scope) | Enable Project Scope | `bool` | `false` | no |
| <a name="input_enable_uptime_checks"></a> [enable\_uptime\_checks](#input\_enable\_uptime\_checks) | Enable Uptime Checks | `bool` | `false` | no |
| <a name="input_gcp_org_id"></a> [gcp\_org\_id](#input\_gcp\_org\_id) | Google Organization ID | `string` | `""` | no |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |
| <a name="input_groups"></a> [groups](#input\_groups) | Group configuration objects | `list(object({}))` | `[]` | no |
| <a name="input_logging_metrics"></a> [logging\_metrics](#input\_logging\_metrics) | Logging Metric configuration objects | `list(object({}))` | `[]` | no |
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | Notification Channel configuration objects | `list(object({}))` | `[]` | no |
| <a name="input_uptime_checks"></a> [uptime\_checks](#input\_uptime\_checks) | Uptime Check configuration objects | `list(object({}))` | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
