
locals {
  parents = { for group in var.groups :
    group.display_name => {
      display_name = group.display_name
      filter       = group.filter
      #is_cluster   =
    } if group.parent_name == null
  }
  subgroups1 = { for group in var.groups :
    "${group.parent_name}:${group.display_name}" => {
      display_name = group.display_name
      filter       = group.filter
      #is_cluster   =
      parent_name = group.parent_name
    } if group.parent_name != null && try(length(split(":", group.parent_name)) == 1, false) == true
  }
  subgroups2 = { for group in var.groups :
    "${group.parent_name}:${group.display_name}" => {
      display_name = group.display_name
      filter       = group.filter
      #is_cluster   =
      parent_name = group.parent_name
    } if group.parent_name != null && try(length(split(":", group.parent_name)) == 2, false) == true
  }
}

## Can do 1 resource per level. Anything better?
resource "google_monitoring_group" "parents" {
  for_each     = { for group in local.parents : group.display_name => group }
  display_name = each.value.display_name
  filter       = each.value.filter
  #is_cluster   =
  project = var.gcp_project
}

resource "google_monitoring_group" "subgroups1" {
  depends_on = [
    google_monitoring_group.parents
  ]
  for_each     = { for group in local.subgroups1 : "${group.parent_name}:${group.display_name}" => group }
  display_name = each.value.display_name
  filter       = each.value.filter
  #is_cluster   =
  parent_name = (lookup(google_monitoring_group.parents, each.value.parent_name, false) == false ?
    null
  : google_monitoring_group.parents[each.value.parent_name].name)
  project = var.gcp_project
}

resource "google_monitoring_group" "subgroups2" {
  depends_on = [
    google_monitoring_group.subgroups1
  ]
  for_each     = { for group in local.subgroups2 : "${group.parent_name}:${group.display_name}" => group }
  display_name = each.value.display_name
  filter       = each.value.filter
  #is_cluster   =
  parent_name = (lookup(google_monitoring_group.subgroups1, each.value.parent_name, false) == false ?
    null
  : google_monitoring_group.subgroups1[each.value.parent_name].name)
  project = var.gcp_project
}
