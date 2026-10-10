output "lakeformation_permissions_id" {
  description = "Map of id values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lakeformation_permissions_catalog_id" {
  description = "Map of catalog_id values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => v.catalog_id if v.catalog_id != null && length(v.catalog_id) > 0 }
}
output "lakeformation_permissions_catalog_resource" {
  description = "Map of catalog_resource values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => v.catalog_resource if v.catalog_resource != null }
}
output "lakeformation_permissions_data_cells_filter" {
  description = "Map of data_cells_filter values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => one(v.data_cells_filter) if v.data_cells_filter != null && length(v.data_cells_filter) > 0 }
}
output "lakeformation_permissions_data_location" {
  description = "Map of data_location values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => one(v.data_location) if v.data_location != null && length(v.data_location) > 0 }
}
output "lakeformation_permissions_database" {
  description = "Map of database values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => one(v.database) if v.database != null && length(v.database) > 0 }
}
output "lakeformation_permissions_lf_tag" {
  description = "Map of lf_tag values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => one(v.lf_tag) if v.lf_tag != null && length(v.lf_tag) > 0 }
}
output "lakeformation_permissions_lf_tag_policy" {
  description = "Map of lf_tag_policy values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => one(v.lf_tag_policy) if v.lf_tag_policy != null && length(v.lf_tag_policy) > 0 }
}
output "lakeformation_permissions_permissions" {
  description = "Map of permissions values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => v.permissions if v.permissions != null && length(v.permissions) > 0 }
}
output "lakeformation_permissions_permissions_with_grant_option" {
  description = "Map of permissions_with_grant_option values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => v.permissions_with_grant_option if v.permissions_with_grant_option != null && length(v.permissions_with_grant_option) > 0 }
}
output "lakeformation_permissions_principal" {
  description = "Map of principal values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => v.principal if v.principal != null && length(v.principal) > 0 }
}
output "lakeformation_permissions_region" {
  description = "Map of region values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => v.region if v.region != null && length(v.region) > 0 }
}
output "lakeformation_permissions_table" {
  description = "Map of table values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => one(v.table) if v.table != null && length(v.table) > 0 }
}
output "lakeformation_permissions_table_with_columns" {
  description = "Map of table_with_columns values across all lakeformation_permissions, keyed the same as var.lakeformation_permissions"
  value       = { for k, v in aws_lakeformation_permissions.lakeformation_permissions : k => one(v.table_with_columns) if v.table_with_columns != null && length(v.table_with_columns) > 0 }
}

