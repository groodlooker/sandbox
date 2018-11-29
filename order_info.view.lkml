view: order_info {
  sql_table_name: public.order_info ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  measure: min_order {
    type: date
    hidden: yes
    sql: min(${order_date}) ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}.profit ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: row_id {
    type: number
    sql: ${TABLE}.row_id ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.sales ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension_group: ship {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ship_date ;;
  }

  dimension: ship_mode {
    type: string
    sql: ${TABLE}.ship_mode ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.sub_category ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name, product_name]
  }

  ## Basic Aggregates ##

  measure: total_sales {
    type: sum
    value_format_name: usd_0
    sql: ${sales} ;;
  }

  measure: total_profit {
    type: sum
    value_format_name: usd_0
    sql: ${profit} ;;
  }

  measure: total_quantity {
    type: sum
    value_format_name: decimal_0
    sql: ${quantity} ;;
  }

  measure: average_discount {
    type: average
    value_format_name: percent_1
    sql: ${discount} ;;
  }

  ## Customer Info ##

  dimension_group: first_purchase {
    type: time
    timeframes: [year, month, month_name, week_of_year]
    sql: (select min(o.order_date)
    from public.order_info o
    where ${TABLE}.customer_name = o.customer_name);;
  }





}
