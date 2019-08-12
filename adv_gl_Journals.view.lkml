view: adv_gl_journals {
  sql_table_name: public.adv_gl_journals ;;

  dimension: journal_name {
    type: string
    sql: ${TABLE}.journal_name ;;
  }

  dimension: journal_number {
    type: string
    sql: ${TABLE}.journal_number ;;
  }

  measure: count {
    type: count
    drill_fields: [journal_name]
  }
}
