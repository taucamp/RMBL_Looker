view: adv_glchart {
  sql_table_name: public.adv_glchart ;;

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

  dimension: accountnumber {
    type: string
    sql: ${TABLE}.accountnumber ;;
  }

  dimension: accountsummary {
    type: string
    sql: ${TABLE}.accountsummary ;;
  }

  dimension: accounttitle {
    type: string
    sql: ${TABLE}.accounttitle ;;
  }

  dimension: accounttype {
    type: string
    sql: ${TABLE}.accounttype ;;
  }

  dimension: balancesheetflag {
    type: string
    sql: ${TABLE}.balancesheetflag ;;
  }

  dimension: dealer_id {
    type: string
    sql: ${TABLE}.dealer_id ;;
  }

  dimension: scheduledflag {
    type: string
    sql: ${TABLE}.scheduledflag ;;
  }

  dimension: scheduletype {
    type: string
    sql: ${TABLE}.scheduletype ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
