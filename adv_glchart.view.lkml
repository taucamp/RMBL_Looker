view: Advent_Chart_of_Accounts {
  sql_table_name: public.adv_glchart ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
    type: time
    hidden: yes
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
    hidden: yes
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

  dimension: account_number {
    type: string
    sql: ${TABLE}.accountnumber ;;
  }

  dimension: accountsummary {
    type: string
    hidden: yes
    sql: ${TABLE}.accountsummary ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.accounttitle ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.accounttype ;;
  }

  dimension: is_balance_sheet_acct {
    type: string
    sql: ${TABLE}.balancesheetflag ;;
  }

  dimension: dealer_id {
    type: string
    hidden: yes
    sql: ${TABLE}.dealer_id ;;
  }

  dimension: scheduledflag {
    type: string
    hidden: yes
    sql: ${TABLE}.scheduledflag ;;
  }

  dimension: scheduletype {
    type: string
    hidden: yes
    sql: ${TABLE}.scheduletype ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
