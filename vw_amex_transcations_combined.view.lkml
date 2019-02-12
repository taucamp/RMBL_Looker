view: vw_amex_transcations_combined {
  sql_table_name: american_express.vw_amex_transcations_combined ;;

  dimension: account_number {
    type: string
    sql: ${TABLE}."account number" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: card_member {
    type: string
    sql: ${TABLE}."card member" ;;
  }

  dimension: card_source {
    type: string
    sql: ${TABLE}."card source" ;;
  }

  dimension: cardnumber_last5 {
    type: string
    sql: ${TABLE}.cardnumber_last5 ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city_state_zip {
    type: string
    sql: ${TABLE}."city state zip" ;;
  }

  dimension: departmenet {
    type: string
    sql: ${TABLE}.departmenet ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: doing_business_as {
    type: string
    sql: ${TABLE}."doing business as" ;;
  }

  dimension: expense_category {
    type: string
    sql: ${TABLE}."expense category" ;;
  }

  dimension: expense_subcategory {
    type: string
    sql: ${TABLE}."expense subcategory" ;;
  }

  dimension: extended_details {
    type: string
    sql: ${TABLE}."extended details" ;;
  }

  dimension_group: monthended {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.monthended ;;
  }

  dimension: parent_company {
    type: string
    sql: ${TABLE}."parent company" ;;
  }

  dimension: receipt {
    type: string
    sql: ${TABLE}.receipt ;;
  }

  dimension: receipt_url {
    type: string
    sql: ${TABLE}."receipt url" ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: street_address {
    type: string
    sql: ${TABLE}."street address" ;;
  }

  dimension_group: transaction_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."transaction date" ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}."transaction type" ;;
  }

  dimension_group: weekended {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.weekended ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: amount_spent {
    type: sum
    sql: ${TABLE}.amount ;;
  }


}
