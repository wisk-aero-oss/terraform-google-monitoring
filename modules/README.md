
# Code for managing Google Cloud Monitoring

Code to manage Google Cloud Monitoring and Logging components

### Terraform modules

- [Alert Policies](alert-policies/README.md)
- [Dashboards](dashboards/README.md)
- [Data Access Audit Logs](data-access-audit-logs/README.md)
- [Groups](groups/README.md)
- [Log Metrics](log-metrics/README.md)
- [Central Logging](logging/README.md)
- [Metric Descriptors](metric-descriptors/README.md)
- [Notification Channels](notification-channels/README.md)
- [Metric Project Scope](project-scope/README.md)
- [Services](services/README.md)
- [SLO](slo/README.md)
- [Uptime Checks](uptime-checks/README.md)

#### Convert data from services into Terraform

- [Commands to get json source data](collect-data.md)

### Google API to enable (change to Terraform)

- [Enable Google APIs](enable-apis.md)

### References

- https://cloud.google.com/composer/docs/terraform-cross-project-monitoring
- https://www.cloudskillsboost.google/focuses/5157?parent=catalog
- Grafana
  - https://grafana.com/docs/grafana/latest/datasources/google-cloud-monitoring/
- Pagerduty
  - https://storytel.tech/gcp-integration-with-pagerduty-using-terraform-257db26363f9
- Prometheus
  - https://cloud.google.com/stackdriver/docs/managed-prometheus
