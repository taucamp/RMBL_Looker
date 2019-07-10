view: wells_transactions {
  sql_table_name: public.wells_transactions ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: 0_day_flt_amt {
    type: string
    sql: ${TABLE}."0 day flt amt" ;;
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

  dimension: acct_name {
    type: string
    sql: ${TABLE}."acct name" ;;
  }

  dimension: acct_no {
    type: number
    sql: ${TABLE}."acct no" ;;
  }

  dimension: asof_date {
    type: string
    sql: ${TABLE}."as-of date" ;;
  }

  dimension: asoftime {
    type: string
    sql: ${TABLE}."as-of-time" ;;
  }

  dimension: bai_type_code {
    type: number
    sql: ${TABLE}."bai type code" ;;
  }

  dimension: bank_reference {
    type: string
    sql: ${TABLE}."bank reference" ;;
  }

  dimension: credit_amt {
    type: string
    sql: ${TABLE}."credit amt" ;;
  }

  dimension: customer_ref_no {
    type: string
    sql: ${TABLE}."customer ref no" ;;
  }

  dimension: debit_amt {
    type: string
    sql: ${TABLE}."debit amt" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: descriptive_text_1 {
    type: string
    sql: ${TABLE}."descriptive text 1" ;;
  }

  dimension: descriptive_text_2 {
    type: string
    sql: ${TABLE}."descriptive text 2" ;;
  }

  dimension: tran_desc {
    type: string
    sql: ${TABLE}."tran desc" ;;
  }

  dimension: tran_status {
    type: string
    sql: ${TABLE}."tran status" ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}."unique id" ;;
  }

  dimension: value_date {
    type: string
    sql: ${TABLE}."value date" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, acct_name]
  }
}
