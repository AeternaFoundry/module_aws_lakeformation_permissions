variable "lakeformation_permissions" {
  description = <<EOT
Map of lakeformation_permissions, attributes below
Required:
    - permissions
    - principal
Optional:
    - catalog_id
    - catalog_resource
    - permissions_with_grant_option
    - region
    - data_cells_filter (block):
        - database_name (required)
        - name (required)
        - table_catalog_id (required)
        - table_name (required)
    - data_location (block):
        - arn (required)
        - catalog_id (optional)
    - database (block):
        - catalog_id (optional)
        - name (required)
    - lf_tag (block):
        - catalog_id (optional)
        - key (required)
        - values (required)
    - lf_tag_policy (block):
        - catalog_id (optional)
        - expression (required, block):
            - key (required)
            - values (required)
        - resource_type (required)
    - table (block):
        - catalog_id (optional)
        - database_name (required)
        - name (optional)
        - wildcard (optional)
    - table_with_columns (block):
        - catalog_id (optional)
        - column_names (optional)
        - database_name (required)
        - excluded_column_names (optional)
        - name (required)
        - wildcard (optional)
EOT

  type = map(object({
    permissions                   = set(string)
    principal                     = string
    catalog_id                    = optional(string)
    catalog_resource              = optional(bool)
    permissions_with_grant_option = optional(set(string))
    region                        = optional(string)
    data_cells_filter = optional(object({
      database_name    = string
      name             = string
      table_catalog_id = string
      table_name       = string
    }))
    data_location = optional(object({
      arn        = string
      catalog_id = optional(string)
    }))
    database = optional(object({
      catalog_id = optional(string)
      name       = string
    }))
    lf_tag = optional(object({
      catalog_id = optional(string)
      key        = string
      values     = set(string)
    }))
    lf_tag_policy = optional(object({
      catalog_id = optional(string)
      expression = list(object({
        key    = string
        values = set(string)
      }))
      resource_type = string
    }))
    table = optional(object({
      catalog_id    = optional(string)
      database_name = string
      name          = optional(string)
      wildcard      = optional(bool)
    }))
    table_with_columns = optional(object({
      catalog_id            = optional(string)
      column_names          = optional(set(string))
      database_name         = string
      excluded_column_names = optional(set(string))
      name                  = string
      wildcard              = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.lakeformation_permissions : (
        v.lf_tag_policy == null || (length(v.lf_tag_policy.expression) >= 1)
      )
    ])
    error_message = "Each expression list must contain at least 1 items"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

