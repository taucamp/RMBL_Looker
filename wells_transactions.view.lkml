view: wells_transactions {
  sql_table_name: public.wells_transactions ;;



  set: Wells_Balances {
    fields: [
      account_name,
      account_number,
      bai_type_code,
      transaction_type,
      transaction_status,
      bank_reference,
      customer_ref_no,
      description,
      descriptive_text_1,
      descriptive_text_2,
      debit_amt,
      credit_amt
    ]
  }


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: 0_day_flt_amt {
    hidden: yes
    type: number
    value_format_name: usd
    sql: nvl(f_sql_char_to_numeric(${TABLE}."0 day flt amt"),0) ;;
  }

  dimension: 1_day_flt_amt {
    hidden: yes
    type: number
    value_format_name: usd
    sql: nvl(f_sql_char_to_numeric(${TABLE}."1 day flt amt"),0) ;;
  }

  dimension: 2_day_flt_amt {
    hidden: yes
    type: number
    value_format_name: usd
    sql: nvl(f_sql_char_to_numeric(${TABLE}."2+ day flt amt"),0) ;;
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
    type: number
    sql: ${TABLE}."acct no" ;;
  }

  dimension_group: transaction_as_of {
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
    sql: TO_DATE(${TABLE}."as-of date",'YYYY-MM-DD') ;;
  }



  dimension: asoftime {
    hidden:yes
    type: string
    sql: ${TABLE}."as-of-time" ;;
  }

  dimension: bai_type_code {
    hidden:no
    type: number
    sql: ${TABLE}."bai type code" ;;
  }

  dimension: bank_reference {
    hidden:yes
    type: string
    sql: ${TABLE}."bank reference" ;;
  }

  dimension: credit_amt {
    hidden: yes
    type: number
    value_format_name: usd
    sql: nvl(f_sql_char_to_numeric(${TABLE}."credit amt"),0) ;;
  }

  dimension: customer_ref_no {
    hidden:yes
    type: string
    sql: ${TABLE}."customer ref no" ;;
  }

  dimension: debit_amt {
    hidden: yes
    type: number
    value_format_name: usd
    sql: nvl(f_sql_char_to_numeric(${TABLE}."debit amt"),0) ;;
  }

  dimension: description {
    hidden:yes
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: descriptive_text_1 {
    hidden:yes
    type: string
    sql: ${TABLE}."descriptive text 1" ;;
  }

  dimension: descriptive_text_2 {
    hidden:yes
    type: string
    sql: ${TABLE}."descriptive text 2" ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}."tran desc" ;;
  }

  dimension: transaction_status {
    type: string
    sql: ${TABLE}."tran status" ;;
  }

  dimension: transaction_amount {
    type: string
    sql: ${credit_amt} - ${debit_amt}  ;;
  }

  dimension: inflow_or_outflow {
    type: string
    sql: case when ${debit_amt} > 0 then 'Outflow' else 'Inflow' end ;;
  }


  dimension: unique_id {
    hidden:yes
    type: string
    sql: ${TABLE}."unique id" ;;
  }

  dimension_group: value {
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
    sql: TO_DATE(${TABLE}."value date",'YYYY-MM-DD') ;;
  }


#####################
#####################
# MEASURES
#####################
#####################

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: transaction_total {
    type: sum
    value_format_name: usd
    sql: ${transaction_amount} ;;

  }

  measure: debits_total {
    type: sum
    value_format_name: usd
    sql: ${debit_amt} ;;

  }

  measure: credits_total {
    type: sum
    value_format_name: usd
    sql: ${credit_amt} ;;

  }

  measure: 0_day_float_total {
    type: sum
    value_format_name: usd
    sql: ${0_day_flt_amt} ;;

  }

  measure: 1_day_float_total {
    type: sum
    value_format_name: usd
    sql: ${1_day_flt_amt} ;;

  }

  measure: 2_day_float_total {
    type: sum
    value_format_name: usd
    sql: ${2_day_flt_amt} ;;

  }



}
