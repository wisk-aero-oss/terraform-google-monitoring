#!/usr/bin/env bash

# Create firewall forwarding rules for uptime checks for all networks that have GKE clusters

### WIP

# For all projects
for project in $(gcloud projects list --format="value(projectId)" | grep -v ^sys-); do
  # shellcheck disable=SC2046
  if [ $(gcloud services list --project="${project}" 2>/dev/null | grep -c container.googleapis.com) -eq 1 ]; then
    # For all GKE clusters
    for cluster in $(gcloud container clusters list --project="${project}" --format="value(name)"); do
      # subnetwork, zone, location, locations,
      # get location (zone or region) - Unknown if need
      # shellcheck disable=SC2086
      loc=$(gcloud --project="${project}" container clusters list \
        --format="value[separator=' → '](name,location,nodePools.selfLink)" \
        | grep ^${cluster} | awk -F/ '{print $7 "=" $8}')
      loc_type=${loc%%=*}
      [ "${loc_type}" == "zones" ] && loc_type='zone'
      [ "${loc_type}" == "locations" ] && loc_type='region'
      location=${loc##*=}
      echo "Cluster: ${cluster} at Loc Type: ${loc_type} Location: ${location}"
      # get networks that node pools are in and build list
      #   cluster has subnetwork not node pool ?
      #   get network from looking up subnet ?
      #   node pool -> instance group -> instance template -> network interfaces -> network/subnetwork
      #   node pool -> instance group -> primary network/subnetwork
      #     node pool -> instanceGroupUrls,
      #gcloud compute instance-groups describe "${group}" \
      #  --project="${project}" \
      #  --zone="${zone}" --format="value(network)"
      #gcloud container node-pools list --cluster=${cluster} \
      #  --project=${project} \
      #  --${loc_type} ${location} \
      #  --format="value[separator=';'](name,locations)" \
      #  | \
      #  awk '{print $2}' | sort | uniq | while read network; do
      #    echo "Network: ${network}"

    done
    # reduce to unique network list per project
    # create firewall rule for each network
  fi
done

#project=''
#network=''
#gcloud compute firewall-rules create "uptime-checks-${network}" \
#  --description="Allow uptime checks to reach GKE clusters" \
#  --network="${network}"  \
#  --action=allow --direction=ingress \
#  --source-ranges="35.199.192.0/19" \
#  --rules=tcp --project="${project}"
#
#gcloud compute firewall-rules list
