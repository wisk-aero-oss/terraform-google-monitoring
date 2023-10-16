
#data "google_organization" "self" {
#  domain = var.organization_name
#}

data "google_projects" "self" {
  #filter = "parent.id:${data.google_organization.self.org_id}"
  # Get all active projects
  filter = "lifecycleState:ACTIVE"
}

locals {
  # Filter out gsuite projects
  projects_active = [for project in data.google_projects.self.projects : project
    if !startswith(project.project_id, "sys-")
  ]
}
