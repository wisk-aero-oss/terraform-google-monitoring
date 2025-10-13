
# Could do an asset search forprojects in organization,
# but that requires Security Control Center to be enabled

data "google_organization" "self" {
  domain = var.organization_name
}

# Get all folders (currently top 3 folder layers only)
#   https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folders
data "google_folders" "level1" {
  parent_id = data.google_organization.self.name
}
data "google_folders" "level2" {
  for_each  = { for folder in data.google_folders.level1.folders : regex("/(.*)", folder.name)[0] => folder }
  parent_id = each.value.name
}
data "google_folders" "level3" {
  for_each  = toset([for k, folder in local.folders2 : k])
  parent_id = "folders/${each.value}"
}
locals {
  folders1 = { for folder in data.google_folders.level1.folders : regex("/(.*)", folder.name)[0] => folder }
  folders2 = merge(distinct(flatten([
    for parent in data.google_folders.level2 : {
      for folder in parent.folders :
    regex("/(.*)", folder.name)[0] => folder }
  ]))...)
  folders3 = merge(distinct(flatten([
    for parent in data.google_folders.level3 : {
      for folder in parent.folders :
    regex("/(.*)", folder.name)[0] => folder }
  ]))...)
  folders = merge(local.folders1, local.folders2, local.folders3)
}

# Get all projects
#   https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects
data "google_projects" "self" {
  #filter = "parent.id:${data.google_organization.self.org_id}" # Not projects in folders
  # Get all active projects - All organizations that have access to
  filter = "lifecycleState:ACTIVE"
}

locals {
  # Filter out gsuite projects
  projects_active = [for project in data.google_projects.self.projects : project
    if length(regexall("^(app|gam|gen-lang-client|sys)-", project.project_id)) == 0
    # Can add "quickstart" as well
  ]
  project_org = [
    for project in local.projects_active :
    project if project.parent.type == "organization" && "organizations/${project.parent.id}" == data.google_organization.self.id
  ]
  # Projects unders folders
  # Use folder list to filter out any projects not in organization
  project_folders = [
    for project in local.projects_active :
    project if project.parent.type == "folder" && contains(keys(local.folders), project.parent.id)
  ]
  # All projects in the organization
  projects = concat(local.project_org, local.project_folders)
}
