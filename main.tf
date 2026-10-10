resource "aws_lakeformation_permissions" "lakeformation_permissions" {
  for_each = var.lakeformation_permissions

  permissions                   = each.value.permissions
  principal                     = each.value.principal
  catalog_id                    = each.value.catalog_id
  catalog_resource              = each.value.catalog_resource
  permissions_with_grant_option = each.value.permissions_with_grant_option
  region                        = each.value.region

  dynamic "data_cells_filter" {
    for_each = each.value.data_cells_filter != null ? [each.value.data_cells_filter] : []
    content {
      database_name    = data_cells_filter.value.database_name
      name             = data_cells_filter.value.name
      table_catalog_id = data_cells_filter.value.table_catalog_id
      table_name       = data_cells_filter.value.table_name
    }
  }

  dynamic "data_location" {
    for_each = each.value.data_location != null ? [each.value.data_location] : []
    content {
      arn        = data_location.value.arn
      catalog_id = data_location.value.catalog_id
    }
  }

  dynamic "database" {
    for_each = each.value.database != null ? [each.value.database] : []
    content {
      catalog_id = database.value.catalog_id
      name       = database.value.name
    }
  }

  dynamic "lf_tag" {
    for_each = each.value.lf_tag != null ? [each.value.lf_tag] : []
    content {
      catalog_id = lf_tag.value.catalog_id
      key        = lf_tag.value.key
      values     = lf_tag.value.values
    }
  }

  dynamic "lf_tag_policy" {
    for_each = each.value.lf_tag_policy != null ? [each.value.lf_tag_policy] : []
    content {
      catalog_id = lf_tag_policy.value.catalog_id
      dynamic "expression" {
        for_each = lf_tag_policy.value.expression
        content {
          key    = expression.value.key
          values = expression.value.values
        }
      }
      resource_type = lf_tag_policy.value.resource_type
    }
  }

  dynamic "table" {
    for_each = each.value.table != null ? [each.value.table] : []
    content {
      catalog_id    = table.value.catalog_id
      database_name = table.value.database_name
      name          = table.value.name
      wildcard      = table.value.wildcard
    }
  }

  dynamic "table_with_columns" {
    for_each = each.value.table_with_columns != null ? [each.value.table_with_columns] : []
    content {
      catalog_id            = table_with_columns.value.catalog_id
      column_names          = table_with_columns.value.column_names
      database_name         = table_with_columns.value.database_name
      excluded_column_names = table_with_columns.value.excluded_column_names
      name                  = table_with_columns.value.name
      wildcard              = table_with_columns.value.wildcard
    }
  }
}

