
output "parents" {
  description = "Root parent groups"
  value       = local.parents
}
output "subgroups1" {
  description = "Subgroups - level 1"
  value       = local.subgroups1
}
output "subgroups2" {
  description = "Subgroups - level 2"
  value       = local.subgroups2
}

output "r_subgroups1" {
  description = "Resource: subgroups level 1"
  value       = google_monitoring_group.subgroups1
}
output "r_subgroups2" {
  description = "Resource: subgroups level 2"
  value       = google_monitoring_group.subgroups2
}
