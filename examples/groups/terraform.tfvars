
gcp_project = "company-monitoring"

# https://cloud.google.com/monitoring/api/v3/filters#filter_syntax
# Filter conditions
#   resource.metadata.region
#   resource.metadata.name
#   resource.labels.project_id
#
# operators
#   != = > < >= <= :
#
# functions
#   has_substring(\"Skip Me\")
#
#   ends_with(<string>)
#   has_substring(<string> [, ignore_case=false])
#   monitoring.regex.full_match(<RE2-string>)
#   one_of(<string>,...,<string>) for up to 100 strings
#   starts_with(<string>)
# grouping
#   ()
#   AND
#   OR
#   NOT

# pub/sub, cloud sql, VMs, disks, cloud router, network, k8 contsiner/node/pod
groups = [
  # Root parents
  {
    display_name = "All"
    filter       = "resource.metadata.name != has_substring(\"Skip Me\")"
  },
  {
    display_name = "Production"
    filter       = "resource.labels.project_id = \"company-production\""
  },
  {
    display_name = "GKE"
    filter       = "resource.metadata.name = starts_with(\"gke-\")"
  },
  # Subgroups - level 1
  {
    display_name = "Region West1",
    filter       = "resource.metadata.region = \"us-west1\""
    parent_name  = "All",
  },
  {
    display_name = "GKE"
    filter       = "resource.labels.project_id = \"company-production\" AND resource.metadata.name = starts_with(\"gke-\")"
    parent_name  = "Production"
  },
  # Subgroups - level 2
  {
    display_name = "Central"
    filter       = "resource.metadata.region = \"us-central1\""
    parent_name  = "Production:GKE"
  }
]
