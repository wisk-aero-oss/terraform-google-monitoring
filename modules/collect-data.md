
# Commands for collecting data to convert into Terraform

## Google

As of now Google lacks full support to manage their monitoring services.
The gcloud CLI has 3 releases (alpha, beta, and GA) and APIs. All are needed.

Some of the terraform modules have scripts to do ~90% of the work to convert these outputs to Terraform data.

### gcloud GA - Available commands

>gcloud monitoring dashboards

### gcloud BETA - Available commands
```shell
gcloud beta monitoring channel-descriptors list --format json
gcloud beta monitoring channels list --format json
gcloud beta monitoring dashboards list  --format json
gcloud beta monitoring metrics-scopes list [project id]
```

### gcloud ALPHA - Available commands
```shell
gcloud alpha monitoring channel-descriptors list --format json
gcloud alpha monitoring channels list --format json
gcloud alpha monitoring dashboards list --format json
gcloud alpha monitoring metrics-scopes list [project id]
gcloud alpha monitoring policies list --format json
gcloud alpha monitoring snoozes list --format json
```

### Google API

#### Service

#### Uptime checks

_ https://medium.com/google-cloud/_ stackdriver-monitoring-automation-part-3-uptime-checks-476b8507f59c
_ https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.uptimeCheckConfigs/list
_ https://developers.google.com/resources/api-libraries/documentation/monitoring/v3/python/latest/monitoring_v3.projects.uptimeCheckConfigs.html

## PagerDuty

### PagerDuty API

- list vendors
- list services
