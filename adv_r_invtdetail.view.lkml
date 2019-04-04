view: adv_r_invtdetail {
  sql_table_name: public.adv_r_invtdetail ;;

  set: Inventory_Drillthrough {
    fields: [inventory_status,
      inventory_status_group,
      stock_number,
      location,
      vin,
      model_year,
      make,
      model,
      mileage,
      date_received_date,
      sold_status,
      stock_number,
      suggested_retail,
      cost



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

  dimension: color2 {
    type: string
    sql: ${TABLE}.color2 ;;
  }

  dimension: cost {
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.cost) ;;
  }

  dimension: cost_test {
    type: number
    sql: to_number(${TABLE}.cost) ;;
  }

  dimension: cost_bucket {
    type: tier
    style: integer
    tiers: [0,10000,20000,30000,40000,50000,75000,100000]
    value_format_name: usd_0
    sql: ${cost} ;;
  }


  dimension: transit {
    type: string
    sql: ${TABLE}.equipment1 ;;
  }

    dimension: title_info {
    type: string
    sql: ${TABLE}.equipment2 ;;
  }

  dimension: title_state {
    type: string
    sql: f_sql_parse_inv_equipment2_state(${TABLE}.equipment2) ;;
  }

  dimension: title_date_received {
    type: string
    sql: f_sql_parse_inv_equipment2_date(${TABLE}.equipment2) ;;
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
    sql: to_number(${TABLE}.mileage) ;;
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

  dimension_group: date_received {
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
    sql: f_sql_days_in_inventory_char(${TABLE}.recdate) ;;
  }

  dimension: days_in_inventory_bucket {
    type: tier
    style: integer
    tiers: [0,15,30,45,60]
    value_format_name: decimal_0
    sql: f_sql_days_in_inventory(${TABLE}.recdate::timestamp):int ;;
  }

  dimension_group: date_rs_status {
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

  dimension_group: date_advent_runtime {
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

  dimension: model_year {
    type: number
    value_format_name: id
    sql: to_number(${TABLE}.year) ;;
  }

  dimension: model_year_bucket {
  type: tier
    style: integer
    tiers: [0,2000,2005,2010,2015,2017,2020]
    value_format_name: decimal_0
    sql: ${model_year} ;;
  }

  dimension: is_floorable_model_year {
    type: yesno
    sql: ${model_year} > date_part(year,getdate())-10 ;;
  }

  dimension: is_floorable_mileage {
    type: yesno
    sql: ${mileage} < 150000 ;;
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
    sql:${model_year};;
  }

  measure: average_days_in_inventory {
    type:average
    sql:${days_in_inventory};;
  }


}
