view: adv_r_invtdetail {
  sql_table_name: public.adv_r_invtdetail ;;

  set: Inventory_Drillthrough {
    fields: [inventory_status,
      inventory_status_group,
      stock_number,
      location,
      vin,
      year,
      make,
      model,
      mileage,
      received_date_date,
      sold_status,
      stock_number,
      suggested_retail,
      cost,



    ]
  }

    dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#   dimension_group: __senttime {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.__senttime ;;
#   }
#
#   dimension_group: __updatetime {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.__updatetime ;;
#   }

  dimension: color {
    type: string
    sql: ${TABLE}.color1 ;;
  }

  dimension: cost {
    type: string
    sql: ${TABLE}.cost ;;
  }

  dimension: transit {
    type: string
    sql: ${TABLE}.equipment1 ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.equipment2 ;;
  }

  dimension: equipment3 {
    type: string
    sql: ${TABLE}.equipment3 ;;
  }

  dimension: inventory_status {
    type: string
    sql: f_sql_inventory_status(${TABLE}.invtstatuscode) ;;
  }

  dimension: inventory_status_group {
    type: string
    sql: f_sql_inventory_status_group(${TABLE}.invtstatuscode) ;;
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
    sql: CASE ${TABLE}.orig WHEN '07' THEN 'AUCTION' WHEN '08' THEN 'CLASSIFIEDS' WHEN '03' THEN 'CONSUMER' WHEN '09' THEN 'DEALER' ELSE 'UNKNOWN' END;;
  }

  dimension_group: received_date {
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

  dimension: days_in_inventory {
    type: number
    sql: f_sql_days_in_inventory(${TABLE}.recdate) ;;
  }

  dimension: days_in_inventory_group {
    type: tier
    tiers: [0,15,30,45,60]
    value_format_name: decimal_0
    sql: f_sql_days_in_inventory(${TABLE}.recdate::timestamp):int ;;
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

  dimension: sold_status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: stock_number {
    type: string
    sql: ${TABLE}.stocknum ;;
  }

  dimension: suggretail {
    type: string
    sql: ${TABLE}.suggretail ;;
  }

  dimension: suggested_retail {
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
    drill_fields: [Inventory_Drillthrough*]
  }

   measure: total_suggested_retail {
     type: sum
     sql: ${suggested_retail} ;;
   }

  measure: average_mileage {
    type: average
    sql:{$mileage};;
  }

  measure: average_model_year {
    type: average
    sql:{$year};;
  }

  measure: average_days_in_inventory {
    type:average
    sql:{$days_in_inventory};;
  }


}
