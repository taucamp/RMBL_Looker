view: amex_transactions {
  sql_table_name: american_express.amex transactions ;;

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

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city_state_zip {
    type: string
    sql: ${TABLE}."city state zip" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: doing_business_as {
    type: string
    sql: ${TABLE}."doing business as" ;;
  }

  dimension: extended_details {
    type: string
    sql: ${TABLE}."extended details" ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
}
