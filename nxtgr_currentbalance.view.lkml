view: nxtgr_currentbalance {
  sql_table_name: public.nxtgr_currentbalance ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: collateral_protection {
    type: string
    sql: ${TABLE}."collateral protection" ;;
  }

  dimension_group: date {
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

  dimension: dealer {
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
    sql: ${TABLE}."due date" ;;
  }

  dimension: fee {
    type: string
    sql: ${TABLE}.fee ;;
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
    type: string
    sql: ${TABLE}.interest ;;
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

  dimension: odometer {
    type: string
    sql: ${TABLE}.odometer ;;
  }

  dimension: other {
    type: string
    sql: ${TABLE}.other ;;
  }

  dimension: principal__one_day_loan {
    type: string
    sql: ${TABLE}."principal + one day loan" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: stock_ {
    type: number
    sql: ${TABLE}."stock #"
      ;;
  }

  dimension: title_status {
    type: string
    sql: ${TABLE}."title status" ;;
  }

  dimension: total {
    type: string
    sql: ${TABLE}.total ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
