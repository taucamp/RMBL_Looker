view: acct_division {
  sql_table_name: tomtest.acct_division ;;

#   dimension: division_abbrev {
#     type: string
#     hidden: yes
#     sql: ${TABLE}.division_abbrev ;;
#   }

  dimension: division_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.division_id ;;
  }

  dimension: division_name {
    type: string
    order_by_field:division_rank
    sql: ${TABLE}.division_name ;;
  }

  dimension: division_rank {
    type: number
    sql: ${TABLE}.division_rank ;;
  }

  dimension: division_name_by_rank {
    type: string
    sql: convert(varchar,${division_rank})+'-'+${division_name} ;;
  }

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

#   dimension_group: start {
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
#     sql: ${TABLE}.start_date ;;
#   }

  measure: count {
    type: count
    drill_fields: [division_name]
  }
}
