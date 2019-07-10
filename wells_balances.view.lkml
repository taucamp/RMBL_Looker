view: wells_balances {
  sql_table_name: public.wells_balances ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: 1_day_flt_amt {
    type: string
    sql: ${TABLE}."1 day flt amt" ;;
  }

  dimension: 2_day_flt_amt {
    type: string
    sql: ${TABLE}."2+ day flt amt" ;;
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

  dimension: __sheet {
    type: string
    sql: ${TABLE}.__sheet ;;
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

  dimension: account_name {
    type: string
    sql: ${TABLE}."acct name" ;;
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}."acct no" ;;
  }

  dimension_group: balance_as_of {
    type: time
    hidden: no
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: to_date(${TABLE}."as-of date",'YYYY-MM-DD');;
  }


  dimension: asoftime {
    hidden: yes
    type: string
    sql: ${TABLE}."as-of-time" ;;
  }

  dimension: bank_id {
    hidden: yes
    type: string
    sql: ${TABLE}."bank id" ;;
  }

  dimension: closing_col_bal {
    hidden: yes
    type: number
    value_format_name: usd
    sql: f_sql_char_to_numeric(${TABLE}."closing col bal") ;;
  }

  dimension: closing_ledger_bal {
    hidden: yes
    type: number
    value_format_name: usd
    sql: f_sql_char_to_numeric(${TABLE}."closing ledger bal") ;;
  }

  dimension: mtd_avg_closing_ledger_bal {
    hidden: yes
    type: number
    value_format_name: usd
    sql: f_sql_char_to_numeric(${TABLE}."mtd avg closing ledger bal") ;;
  }

  dimension: mtd_avg_col_bal {
    hidden: yes
    type: number
    value_format_name: usd
    sql: f_sql_char_to_numeric(${TABLE}."mtd avg col bal") ;;
  }

  dimension: opening_available_bal {
    hidden: yes
    type: number
    value_format_name: usd
    sql: f_sql_char_to_numeric(${TABLE}."opening avl bal") ;;
  }

  dimension: total_float {
    hidden: yes
    type: number
    value_format_name: usd
    sql: f_sql_char_to_numeric(${TABLE}."total flt") ;;
  }

  dimension: credit_amount {
    hidden: yes
    type: number
    value_format_name: usd
    sql: f_sql_char_to_numeric(${TABLE}."ttl credit amt") ;;
  }

  dimension: credit_items {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}."ttl credit items" ;;
  }

  dimension: debit_amt {
    hidden: yes
    type: number
    value_format_name: usd
    sql: f_sql_char_to_numeric(${TABLE}."ttl debit amt") ;;
  }

  dimension: debit_items {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}."ttl debit items" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, account_name]
  }

  measure: closing_ledger_balance {
    type: number
    value_format_name: usd
    sql: (${TABLE}.closing_ledger_bal);;
    drill_fields: [id, account_name]
  }

  measure: average_closing_ledger_balance {
    type: number
    value_format_name: usd
    sql: AVG(${TABLE}.closing_ledger_bal);;
    drill_fields: [id, account_name]
  }



}
