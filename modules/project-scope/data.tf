data "google_projects" "self" {
  filter = "parent.id:${var.gcp_org_id}"
}
