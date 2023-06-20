
data "google_organization" "self" {
  count  = var.target_type == "organization" ? 1 : 0
  domain = var.target_id
}
data "google_folder" "self" {
  count  = var.target_type == "folder" ? 1 : 0
  folder = var.target_id
}
