view: adv_gl_schedule_accts {
  sql_table_name: public.adv_gl_schedule_accts ;;

  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number ;;
  }


  dimension: is_active {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: schedule_number {
    type: number
    sql: ${TABLE}.schedule_number ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
