#!/usr/bin/env bash

# Setup all projects for central monitoring

project_metric_scope='SET-TO-YOUR-MONITORING-PROJECT'

project_metric_scope_number=$(gcloud projects describe "${project_metric_scope}" --format='get(projectNumber)')

## Create service account if it doesn't exist
gcloud beta services identity create --service=monitoring.googleapis.com \
   --project="${project_metric_scope}"
## Add monitoring permissions (will have this, if Goggle created the account)
gcloud projects add-iam-policy-binding "${project_metric_scope}" --project="${project_metric_scope}" \
  --member="serviceAccount:service-${project_metric_scope_number}@gcp-sa-monitoring-notification.iam.gserviceaccount.com" \
  --role='roles/monitoring.notificationServiceAgent'
## Authorize monitoring service account access to Service Directory
gcloud projects add-iam-policy-binding "${project_metric_scope}" --project="${project_metric_scope}" \
  --member="serviceAccount:service-${project_metric_scope_number}@gcp-sa-monitoring-notification.iam.gserviceaccount.com" \
  --role='roles/servicedirectory.pscAuthorizedService'

# for all projects
for project in $(gcloud projects list --format="value(projectId)" | grep -v ^sys-); do
  # shellcheck disable=SC2046
  if [ $(gcloud services list --project="${project}" 2>/dev/null | grep -c container.googleapis.com) -eq 1 ]; then
    # if GKE engine enabled - setup project
    ## Enable services
    gcloud services enable --project="${project}" \
      compute.googleapis.com monitoring.googleapis.com \
      servicedirectory.googleapis.com servicenetworking.googleapis.com \
      anthos.googleapis.com gkehub.googleapis.com
    ## Enable Fleet to Service Directory integration
    #   both of these commands appear to be the same
    #gcloud alpha container hub service-directory enable \
    #  --project="${project}"
    gcloud alpha container fleet service-directory enable \
      --project="${project}"
    ## Authorize monitoring service account access to Service Directory
    gcloud projects add-iam-policy-binding "${project}" --project="${project}" \
      --member="serviceAccount:service-${project_metric_scope_number}@gcp-sa-monitoring-notification.iam.gserviceaccount.com" \
      --role='roles/servicedirectory.pscAuthorizedService' \
      --condition=None
    ## Bind cross project permissions - Not needed ?
    #gcloud projects add-iam-policy-binding "${project} "--project="${project}" \
    #  --member="serviceAccount:service-${project_metric_scope_number}@gcp-sa-monitoring-notification.iam.gserviceaccount.com" \
    #  --role='roles/servicedirectory.viewer' \
    #  --condition=None
  fi
done
