# Google Cloud Monitoring - Services

- Terraform currently doesn't support
  - cloudRun
  - gkeNamespace
  - gkeWorkload
  - gkeService
  - istio services

## API

- https://cloud.google.com/monitoring/api/ref_v3/rest/v3/services

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.62 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_custom_service.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_custom_service) | resource |
| [google_monitoring_service.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_services"></a> [custom\_services](#input\_custom\_services) | List of Custom Service configuration objects | <pre>list(object({<br>    display_name = optional(string)<br>    service_id   = optional(string)<br>    telemetry = optional(object({<br>      resource_name = optional(string)<br>    }))<br>    user_labels = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | List of Service configuration objects | <pre>list(object({<br>    basic_service = optional(object({<br>      service_labels = optional(map(string))<br>      service_type   = optional(string) # validate<br>    }))<br>    display_name = string<br>    service_id   = string<br>    user_labels  = optional(map(string))<br>  }))</pre> | <pre>[<br>  {<br>    "display_name": "",<br>    "service_id": ""<br>  }<br>]</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
