#!/usr/bin/env bash

# Add all GKE clusters to fleet

# for all projects
for project in $(gcloud projects list --format="value(projectId)" | grep -v ^sys-); do
  # shellcheck disable=SC2046
  if [ $(gcloud services list --project="${project}" 2>/dev/null | grep -c container.googleapis.com) -eq 1 ]; then
    # for all GKE clusters
    for cluster in $(gcloud container clusters list --project="${project}" --format="value(name)"); do
      # get location (zone or region)
      # shellcheck disable=SC2086
      loc=$(gcloud --project="${project}" container clusters list \
        --format="value[separator=' → '](name,location,nodePools.selfLink)" \
        | grep ^${cluster} | awk -F/ '{print $7 "=" $8}')
      loc_type=${loc%%=*}
      [ "${loc_type}" == "zones" ] && loc_type='zone'
      [ "${loc_type}" == "locations" ] && loc_type='region'
      location=${loc##*=}
      echo "Cluster: ${cluster} at Loc Type: ${loc_type} Location: ${location}"

      ### Register GKE cluster with fleet (can be in terraform)
      # shellcheck disable=SC2086
      gcloud beta container clusters update "${cluster}" \
        --fleet-project="${project}" \
        --${loc_type} "${location}" \
        --project="${project}"
      # shellcheck disable=SC2086
      gcloud beta container clusters update "${cluster}" \
        --workload-pool="${project}.svc.id.goog" \
        --${loc_type} "${location}" \
        --project="${project}"
    done
  fi
done
