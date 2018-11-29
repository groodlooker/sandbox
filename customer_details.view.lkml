view: customer_details {
  derived_table: {
    explore_source: orders {
      column: customer_name {}
      column: min_order {}
    }
  }
  dimension: customer_name {
    primary_key: yes
    hidden: yes
  }
  dimension_group: min_order {
    type: time
    timeframes: [date,day_of_year,month,month_name,year]
  }
}
