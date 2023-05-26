
data "google_organization" "self" {
  domain = var.organization_name
}

data "google_projects" "self" {
  filter = "parent.id:${data.google_organization.self.org_id}"
}
