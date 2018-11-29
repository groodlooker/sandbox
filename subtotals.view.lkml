view: subtotals {
  derived_table: {
    sql:     SELECT
  orders.category  AS "category",
  orders.sub_category  AS "sub_category",
  COALESCE(SUM(orders.sales ), 0) AS "total_sales"
FROM public.order_info  AS orders
GROUP BY 1,2
UNION ALL
SELECT
  o.category  AS "category",
  concat(o.category,' Subtotal')  AS "sub_category",
  COALESCE(SUM(o.sales ), 0) AS "total_sales"
FROM public.order_info  AS o
GROUP BY 1,2
;;

  }

  dimension: category {
    type: string

  }
  dimension: sub_category {
    type: string
    html: {% if value contains "Subtotal" %} <b>{{value}}</b> {% else %} {{value}} {% endif %} ;;

  }
  dimension: total_sales {
    type: number
    value_format_name: usd_0
    html: {% if sub_category._value contains "Subtotal" %} <b>{{rendered_value}}</b> {% else %} {{rendered_value}} {% endif %} ;;
  }
}

explore: subtotals {}
