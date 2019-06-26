view: adv_gl_schedules {
  sql_table_name: public.adv_gl_schedules ;;

  dimension_group: enddate {
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

  dimension: isactive {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: schedulenum {
    type: number
    sql: ${TABLE}.schedulenum ;;
  }

  dimension: scheduletitle {
    type: string
    sql: ${TABLE}.scheduletitle ;;
  }

  dimension_group: startdate {
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