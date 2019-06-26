view: adv_gl_schedule_accts {
  sql_table_name: public.adv_gl_schedule_accts ;;

  dimension: account_number {
    type: string
    sql: ${TABLE}.accountnum ;;
  }


  dimension: isactive {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: schedulenum {
    type: number
    sql: ${TABLE}.schedulenum ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}