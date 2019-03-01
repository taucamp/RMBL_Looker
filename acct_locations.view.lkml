view: acct_locations {
  sql_table_name: tomtest.acct_locations ;;

#   dimension_group: end {
#     type: time
#     hidden: yes
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.end_date ;;
#   }

  dimension: is_active {
    type: number
    sql: ${TABLE}.is_active ;;
  }

#   dimension: location_abbrev {
#     type: string
#     hidden: yes
#     sql: ${TABLE}.location_abbrev ;;
#   }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: location_name {
    type: string
    order_by_field:location_rank
    sql: ${TABLE}.location_name ;;
  }

  dimension: location_rank {
    type: number
    sql: ${TABLE}.location_rank ;;
  }

#   dimension_group: start {
#     hidden: yes
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.start_date ;;
#   }

  measure: count {
    type: count
    drill_fields: [location_name]
  }
}
