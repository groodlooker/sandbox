connection: "postgres-sales-transactions"

# include all the views
include: "*.view"

datagroup: sandbox_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sandbox_default_datagroup

# - explore: date_dimension

# - explore: order_info

# - explore: regional_managers
