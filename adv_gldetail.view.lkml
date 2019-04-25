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
    label: "GL Account"
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






  dimension: all_dates {
    type: string
    sql: CASE WHEN {% condition accounting_date_filter %} ${accounting_date_month} {% endcondition %} THEN ${accounting_date_month} ELSE 'prior_period' END;;
  }

  dimension: amount {
    description: "Amount of the Debit (if positive) or Credit (if negative)"
    type: number
    value_format_name:usd_0
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


  dimension: is_balance_forward {
    type: yesno
    sql: case when ${TABLE}."document_info" ilike('AUTOMATIC BALFWD%') and ${TABLE}.comment ilike('AUTOMTIC%') and ${TABLE}.control ilike ('NOT APPLICABLE%') and ${TABLE}.status is null then 1 else 0 end;;
  }


  measure: count {
    type: count
    label:"# of Rows"
    drill_fields: [GL_Drillthrough*]
  }


   measure: total_amount {
    type: sum
    value_format_name:usd_0
    sql: ${amount}*1 ;;
    drill_fields: [GL_Drillthrough*]
    link: {
      label: "Go to Minor Group and Same time Frame"
      url: "https://rumbleon.looker.com/dashboards/8?Date%20Passed={{ accounting_date_month._value }}&Major%20Group%20Passed={{ acct_chart_of_accounts.major_group._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    html:"<a href="https://rumbleon.looker.com/dashboards/8?Date%20Passed={{ accounting_date_month._value }}&Major%20Group%20Passed={{ acct_chart_of_accounts.major_group._value }}"</a>"  ;;
  }

  measure: absolute_value {
    type: sum
    value_format_name:usd_0
    sql: abs(${amount})*1 ;;
    drill_fields: [GL_Drillthrough*]
  }


  measure: reporting_amount {
    type: sum
    value_format_name:usd_0
    sql: case when left(${account},4) >= '2000' then -1 else 1 end * ${amount} ;;
    drill_fields: [GL_Drillthrough*]
  }



  measure: life_to_date_amount {
    type: running_total
    value_format_name:usd_0
    sql: ${total_amount} ;;
    drill_fields: [GL_Drillthrough*]
  }

  measure: life_to_date_amount2 {
    type: sum
    value_format_name:usd_0
    sql: CASE
      WHEN CAST(${accounting_date_date} AS MONTH) <=CAST(${accounting_date_filter} AS MONTH) then ${amount}
      else 0
      end*1;;
    drill_fields: [GL_Drillthrough*]
  }

#   measure: life_to_date_amount3 {
#     type: sum
#     value_format_name:usd_0
#     filters: {
#       field: accounting_date_month
#       value: "before today"
#     }
#     sql:${amount}
#     drill_fields: [GL_Drillthrough*]
#   }


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

  filter: accounting_date_filter {
    type: date
  }
  filter: filter_to_apply_to_the_month{
    type: date
  }

  dimension: satisfies_filter {
  type: yesno
  hidden: yes
  sql: {% condition filter_to_apply_to_the_month %} ${accounting_date_month} {% endcondition %} ;;
}

  measure: months_date {
    type: sum
    filters: {
      field: satisfies_filter
      value: "yes"
    }

    sql:${amount} ;;
  }




#THIS IT TO CONFIRM THERE IS ACTUALLY DATA IN THE TABLE
  filter: filter_month_is_not_null{
    type: date
  }

  dimension: satisfies_month_is_not_null_Filter {
    type: yesno
    hidden: yes
    sql: {% condition filter_month_is_not_null %} ${accounting_date_month} {% endcondition %} ;;
  }

  measure: months_date_is_not_null {
    type: count
    filters: {
      field: satisfies_filter
      value: "yes"
    }


  }

}
