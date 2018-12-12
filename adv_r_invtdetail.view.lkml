view: adv_r_invtdetail {
  sql_table_name: public.adv_r_invtdetail ;;

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

  dimension: color1 {
    type: string
    sql: ${TABLE}.color1 ;;
  }

  dimension: cost {
    type: string
    sql: ${TABLE}.cost ;;
  }

  dimension: equipment1 {
    type: string
    sql: ${TABLE}.equipment1 ;;
  }

  dimension: equipment2 {
    type: string
    sql: ${TABLE}.equipment2 ;;
  }

  dimension: equipment3 {
    type: string
    sql: ${TABLE}.equipment3 ;;
  }

  dimension: invtstatuscode {
    type: string
    sql: ${TABLE}.invtstatuscode ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: mileage {
    type: number
    sql: ${TABLE}.mileage ;;
  }

  dimension: mileage_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000]
    sql: ${mileage} ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: orig {
    type: string
    sql: ${TABLE}.orig ;;
  }

  dimension: recdate {
    type: string
    sql: ${TABLE}.recdate ;;
  }

  dimension_group: rsstatus {
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
    sql: ${TABLE}.rsstatus ;;
  }

  dimension_group: run {
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
    sql: ${TABLE}."run time" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: stocknum {
    type: string
    sql: ${TABLE}.stocknum ;;
  }

  dimension: suggretail {
    type: string
    sql: ${TABLE}.suggretail ;;
  }

  dimension: tradelinkeddeal {
    type: number
    sql: ${TABLE}.tradelinkeddeal ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
