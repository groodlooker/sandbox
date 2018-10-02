connection: "postgres-sales-transactions"

# include all the views
include: "*.view"

datagroup: sandbox_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sandbox_default_datagroup

explore: orders {
  from: order_info
  join: sales_per_order {
    sql_on: ${orders.order_id} = ${sales_per_order.order_id} ;;
    type: inner
    relationship: many_to_one
  }
}
