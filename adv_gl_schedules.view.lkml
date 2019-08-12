view: adv_gl_schedules {
  sql_table_name: public.adv_gl_schedules ;;

  dimension_group: end {
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
    sql: ${TABLE}.enddate ;;
  }

  dimension: is_active {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: schedule_number {
    type: number
    sql: ${TABLE}.schedule_number ;;
  }

  dimension: schedule_title {
    type: string
    sql: ${TABLE}.schedule_title ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.startdate ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
