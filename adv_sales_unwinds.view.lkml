view: adv_sales_unwinds {
  sql_table_name: public.adv_sales_unwinds ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__updatetime ;;
  }

  dimension_group: acct {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."acct date" ;;
  }

  dimension: dealername {
    type: string
    sql: ${TABLE}.dealername ;;
  }

  dimension: dealnum {
    type: number
    sql: ${TABLE}.dealnum ;;
  }

  dimension: dealstatus {
    type: string
    sql: ${TABLE}.dealstatus ;;
  }

  dimension_group: unwinddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.unwinddate ;;
  }

  dimension: userid {
    type: string
    sql: ${TABLE}.userid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, dealername]
  }
}
