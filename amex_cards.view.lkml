view: amex_cards {
  sql_table_name: american_express.amex_cards ;;

  dimension: cardnumber_last5 {
    type: string
    sql: ${TABLE}.cardnumber_last5 ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
