view: acct_department {
  sql_table_name: tomtest.acct_department ;;

#   dimension: department_abbrev {
#     type: string
#     hidden: yes
#     sql: ${TABLE}.department_abbrev ;;
#   }

  dimension: department_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.department_id ;;
  }

  dimension: department_name {
    type: string
    order_by_field:department_rank
    sql: ${TABLE}.department_name ;;
  }

  dimension: department_rank {
    type: number
    sql: ${TABLE}.department_rank ;;
  }

  dimension: department_name_by_rank {
    type: string
    sql: convert(varchar,${department_rank})+'-'+${department_name} ;;
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
    drill_fields: [department_name]
  }
}
