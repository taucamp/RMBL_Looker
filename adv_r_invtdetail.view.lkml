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
    value_format_name: decimal_0
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

  dimension_group: recdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: isnull(${TABLE}.recdate,'2000-01-01') ;;
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
    sql:${TABLE}.rsstatus ;;
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
    sql: f_sql_inventory_status(${TABLE}.invtstatusvode) ;;
  }

  dimension: status_group {
    type: string
    sql: f_sql_inventory_status_group(${TABLE}.invtstatuscode) ;;
  }


  dimension: stocknum {
    type: string
    sql: ${TABLE}.stocknum ;;
  }

  dimension: suggretail {
    type: string
    sql: ${TABLE}.suggretail ;;
  }

  dimension: suggestedretail {
    type:number
    sql: to_number(suggretail,'S9999999.99') ;;
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

   measure: total_suggested_retail {
     type: sum
     sql: ${suggestedretail} ;;
   }
}
