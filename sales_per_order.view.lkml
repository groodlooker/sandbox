view: sales_per_order {
  derived_table: {
    explore_source: orders {
      column: total_sales {}
      column: total_profit {}
      column: order_id {}
    }
  }
  dimension: total_sales {
    value_format: "$#,##0"
    hidden: yes
    type: number
  }
  dimension: total_profit {
    value_format: "$#,##0"
    hidden: yes
    type: number
  }
  dimension: order_id {
    primary_key: yes
    hidden: yes
  }
  measure: average_order_size {
    type: average
    value_format_name: usd_0
    sql: ${total_sales} ;;
  }
  measure: average_order_profit {
    type: average
    value_format_name: usd_0
    sql: ${total_profit} ;;
  }
}
