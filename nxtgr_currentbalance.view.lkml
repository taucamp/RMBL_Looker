view: nextgear {
  sql_table_name: public.nxtgr_currentbalance ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.__sheet ;;
  }

  dimension_group: __updatetime {
    hidden: yes
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

  dimension: collateral_protection {
    type: number
    sql: f_sql_char_to_numeric(${TABLE}."collateral protection") ;;
  }

  dimension_group: report {
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
    sql: ${TABLE}.date ;;
  }

  dimension: days_on_floor {
    type: number
    sql: ${TABLE}."days on floor" ;;
  }


  dimension: days_on_floor_bucket {
    type: tier
    tiers: [0,15,30,45,60]
    style: integer
    value_format_name: decimal_0
    sql: ${days_on_floor} ;;
  }


  dimension: dealer_name {
    type: string
    sql: ${TABLE}.dealer ;;
  }

  dimension_group: due {
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
    sql: nvl(${TABLE}."due date",'1/1/1900') ;;
  }

  dimension: fee {
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.fee) ;;
  }

  dimension_group: flooring {
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
    sql: ${TABLE}."flooring date" ;;
  }

  dimension: floorplan_status {
    type: string
    sql: ${TABLE}."floorplan status" ;;
  }

  dimension: interest {
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.interest) ;;
  }

  dimension_group: last_paid {
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
    sql: ${TABLE}."last paid" ;;
  }

  dimension: nextgear_id {
    hidden: yes
    type: number
    sql: ${TABLE}.nextgear_id ;;
  }

  dimension: mileage {
    type: number
    sql: nvl(f_sql_char_to_numeric(${TABLE}.odometer),0) ;;
  }

  dimension: mileage_bucket {
    type: tier
    tiers: [0,5000,10000,15000,20000]
    style: integer
    value_format_name: decimal_0
    sql: nvl(f_sql_char_to_numeric(${TABLE}.odometer),0) ;;
  }

    dimension: other {
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.other) ;;
  }

  dimension: principal {
    type: number
    sql: f_sql_char_to_numeric(${TABLE}."principal + one day loan") ;;
  }

  dimension: source {
    type: string
    sql: nvl(${TABLE}.source,'Unkown') ;;
  }

  dimension: next_gear_stock_number {
    type: number
    sql: ${TABLE}."stock #"
      ;;
  }

  dimension: title_status {
    type: string
    sql: ${TABLE}."title status" ;;
  }

  dimension: balance {
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.total) ;;
  }

  dimension: vehicle_description {
    type: string
    sql: ${TABLE}."vehicle description" ;;
  }

  dimension: vehicle_status {
    type: string
    sql: ${TABLE}."vehicle status" ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

#####################
#####################
#MEASURES
#####################
#####################


  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_balance {
    type: sum
    value_format_name: usd_0
    sql: ${balance} ;;
  }

  measure: average_balance {
    type: number
    value_format_name: usd_0
    sql: AVG(${balance}) ;;
  }

  measure: total_principal {
    type: sum
    value_format_name: usd_0
    sql: ${principal} ;;
  }

  measure: average_principal {
    type: number
    value_format_name: usd_0
    sql: AVG(${principal}) ;;
  }

  measure: total_fees {
    type: sum
    value_format_name: usd_0
    sql: ${fee} ;;
  }

  measure: total_interest {
    type: sum
    value_format_name: usd_0
    sql: ${interest} ;;
  }

  measure: total_collateral_protection {
    type: sum
    value_format_name: usd_0
    sql: ${collateral_protection} ;;
  }

  measure: total_other_amounts {
    type: sum
    value_format_name: usd_0
    sql: ${collateral_protection} ;;
  }

  measure: average_mileage {
    type: number
    value_format_name: decimal_0
    sql: AVG(${mileage}) ;;
  }

  measure: average_days_on_floor {
    type: number
    value_format_name: decimal_0
    sql: AVG(${days_on_floor}) ;;
  }


}
