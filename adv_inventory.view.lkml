view: adv_inventory {
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

   dimension: cost_bucket {
    type: tier
    style: relational
    tiers: [0,10000,20000,30000,40000,50000,75000,100000]
    value_format_name: usd_0
    sql: ${cost} ;;
  }

 dimension: blue_book {
    type: number
    value_format_name: usd_0
    sql:  nvl(f_sql_char_to_numeric(${TABLE}."blue book"),0);;
  }

  dimension: has_blue_book {
    type: yesno
    value_format_name: usd_0
    sql:  ${TABLE}."blue book" IS NOT NULL;;
  }
  dimension: blue_book_tier {
    type: tier
    style: relational
    tiers: [0,10000,20000,30000,40000,50000,75000,100000]
    value_format_name: usd_0
    sql:  nvl(f_sql_char_to_numeric(${TABLE}."blue book"),0) ;;
  }

  dimension: dealer {
    type: string
    sql: ${TABLE}.dealername ;;
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
    value_format_name: id
    sql: ${TABLE}.mileage ;;
  }

  dimension: mileage_bucket {
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

  dimension: inventory_source {
    type: string
    sql: f_sql_inventory_origin(${TABLE}.orig);;
  }

  dimension_group: date_received {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: nvl(${TABLE}.recdate,'2000-01-01') ;;
  }

  dimension_group: days_in_inventory {
    type: duration
    intervals: [day]
    sql_start: ${TABLE}.recdate ;;
    sql_end: getdate();;
  }

  dimension: days_in_inventory_bucket {
    type: tier
    style: integer
    tiers: [0,15,30,45,60]
    value_format_name: decimal_0
    sql: ${days_days_in_inventory} ;;
  }

  dimension_group: date_rs_status {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      month_name,
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

   dimension: suggested_retail {
    type:number
    value_format_name: usd_0
    sql: nvl(f_sql_char_to_numeric(${TABLE}.suggretail),0) ;;
  }

  dimension: suggested_retail_tiers {
    type:number
    style: relational
    tiers: [0,5000,15000,20000,25000,35000,50600]
    value_format_name: usd_0
    sql: nvl(f_sql_char_to_numeric(${TABLE}.suggretail),0) ;;
  }



  dimension: tradelinkeddeal {
    type: number
    sql: ${TABLE}.tradelinkeddeal ;;
  }

  dimension: has_trade_linked_deal {
    type: yesno
    sql: ${tradelinkeddeal} IS NOT NULL ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: vehicle_type {
    type: string
    sql: ${TABLE}."veh type" ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  dimension: model_year {
    type: number
    value_format_name: id
    sql: ${TABLE}.year ;;
  }

  dimension: model_year_bucket {
  type: tier
    style: integer
    tiers: [0,2000,2005,2010,2015,2017,2020]
    value_format_name: id
    sql: ${model_year} ;;
  }

  dimension: is_floorable_mileage {
    type: yesno
    sql:${mileage} < 150000 ;;
  }

  dimension: is_floorable_model_year {
    type: yesno
    sql: ${model_year} > date_part(year,getdate())-10 ;;
  }

  dimension: is_floorable_status {
    type: yesno
    sql:${sold_status} = 'Current' ;;
  }

  dimension: is_floorable {
    type: yesno
    sql:${is_floorable_mileage} and  ${is_floorable_model_year} and ${is_floorable_status}  ;;
  }



    measure: count {
    type: count
    value_format_name: decimal_0
    drill_fields: [Inventory_Drillthrough*]
  }

  measure: total_cost {
    description:"Total Cost Paid for all Units"
    type: sum
    value_format_name: usd_0
    sql: ${cost} ;;
  }


  measure: total_suggested_retail {
    description:"Total Suggested Retail Price"
    type: sum
    value_format_name: usd_0
    sql: ${suggested_retail} ;;
   }

  measure: average_mileage {
    type: average
    value_format_name: decimal_0
    sql:${mileage};;
  }

  measure: average_model_year {
    type: average
    value_format_name: id
    sql:${model_year};;
  }

  measure: average_days_in_inventory {
    type:average
    value_format_name: decimal_0
    sql:${days_days_in_inventory};;
  }

  measure: total_blue_book {
    type: sum
    value_format_name: usd_0
    sql: ${blue_book} ;;
  }

}
