view: adv_invt_adds {
  sql_table_name: public.adv_invt_adds ;;


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: stock_number_id {
    type: string
    sql: nvl(f_sql_adv_dealername${TABLE}."store name"),'UNKNOWN')||'-'||${TABLE}."stock number" ;;
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

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: createempno {
    type: number
    sql: ${TABLE}.createempno ;;
  }

  dimension_group: createtimestamp {
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
    sql: ${TABLE}.createtimestamp ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: journal_account_number {
    type: number
    sql: ${TABLE}."journal account number" ;;
  }

  dimension_group: journal_accounting {
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
    sql: ${TABLE}."journal accounting date" ;;
  }

  dimension: journal_reference_number {
    type: string
    sql: ${TABLE}."journal reference number" ;;
  }

  dimension: journal_transaction_id {
    type: string
    sql: ${TABLE}."journal transaction id" ;;
  }

  dimension_group: modified {
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
    sql: ${TABLE}.modified ;;
  }

  dimension: residual {
    type: number
    sql: ${TABLE}.residual ;;
  }

  dimension: retail {
    type: number
    sql: ${TABLE}.retail ;;
  }

  dimension: stock_number {
    type: string
    sql: ${TABLE}."stock number" ;;
  }

  dimension: dealer {
    type: string
    sql: nvl(f_sql_adv_dealername${TABLE}."store name"),'UNKNOWN') ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
