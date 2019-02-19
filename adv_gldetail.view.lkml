view: Advent_GL_detail {
  sql_table_name: public.adv_gldetail ;;

set: GL_Drillthrough {
  fields: [
    accounting_date_date,
    journal,
    account,
    comment,
    control_number,
    document_info,
    document_number,
    status,
    debit_or_credit,
    amount,
    entry_timestamp_date,
    user_who_entered
    ]
}

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

  dimension_group:record_update_time {
    type: time
    description: "Date record last update"
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

  dimension: account {
    type: string
    description: "GL Account"
    sql: ${TABLE}.accountnumber ;;
  }

  dimension_group: accounting_date {
    type: time
    label:"Accounting Date"
    description: "Date used in the financials"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.accounting_date ;;
  }

  dimension: amount {
    description: "Amount of the Debit (if positive) or Credit (if negative)"
    type: number
    value_format_name:usd_2
    sql: ${TABLE}.amount ;;
  }

  dimension: debit_or_credit {
    type: string
    sql: f_sql_debit_or_credit(${TABLE}.amount )  ;;
  }

  dimension: comment {
    type: string
    sql: f_sql_unknown_for_blank(${TABLE}.comment )  ;;
  }

  dimension: control_number {
    type: string
        sql: f_sql_unknown_for_blank(${TABLE}.control )  ;;
  }

  dimension: dealer_id {
    type: string
    hidden: yes
    sql: f_sql_unknown_for_blank(${TABLE}.dealer_id )  ;;
  }

  dimension: document_info {
    type: string
    sql:f_sql_unknown_for_blank(${TABLE}."document_info" ) ;;
  }

  dimension: document_number {
    type: string
    sql: f_sql_unknown_for_blank(${TABLE}."document_number" );;
  }

  dimension_group: entry_timestamp {
    type: time
    label:"Entered Date"
    description: "When the transaction was entered into the GL - not necessarily the actual accounting date"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.entry_timestamp ;;
  }

  dimension: journal {
    type: string
    sql: f_sql_unknown_for_blank(${TABLE}."journalid" );;
  }

  dimension: status {
    type: string
    sql:f_sql_unknown_for_blank(${TABLE}."status" );;
  }

  dimension: user_who_entered {
    type: string
    sql: f_sql_unknown_for_blank(${TABLE}."user" );;
  }

  measure: count {
    type: count
    label:"# of Rows"
    drill_fields: [id]
  }

  measure: total_amount {
    type: sum
    value_format_name:usd_0
    sql: ${amount} ;;
    drill_fields: [GL_Drillthrough*]
  }

  measure: percent_of_total {
    type: percent_of_total
    value_format_name: percent_1
    sql: ${total_amount} ;;
  }

  measure: unique_documents {
    type: count_distinct
    value_format_name:decimal_0
    sql: ${document_number} ;;
    drill_fields: [GL_Drillthrough*]
  }

}
