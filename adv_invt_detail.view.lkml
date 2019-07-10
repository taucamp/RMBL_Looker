view: adv_inventory {
  sql_table_name: public.adv_invt_detail ;;

  set: Inventory_Drillthrough {
    fields: [status,
      is_available_for_sale,
      inventory_user_status_group,
      inventory_user_status,
      is_floorable,
      stock_number,
      location,
      vin,
      model_year,
      make,
      model,
      mileage,
      date_received_date,
      stock_number,
      suggested_retail,
      cost



    ]
  }

  dimension: stock_number_id {
    primary_key: yes
    type: string
    hidden:yes
    sql: nvl(f_sql_adv_dealername(${TABLE}.dealername),'UNKNOWN')||'-'||${TABLE}.stocknum ;;
  }


    dimension: id {
    type: string
    hidden:yes
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

  dimension: appraisal_id {
    description:"The Employee ID of the Buyer"
    type: string
    sql: ${TABLE}.appraisalid ;;
  }
  dimension: color {
    group_label: "Vehicle Detail"
    type: string
    sql: ${TABLE}.color1 ;;
  }

  dimension: color2 {
    group_label: "Vehicle Detail"
    type: string
    sql: ${TABLE}.color2 ;;
  }

  dimension: cost {
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.cost) ;;
  }

   dimension: cost_bucket {
    type: tier
    tiers: [0,10000,20000,30000,40000,50000,75000,100000]
    style: relational
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
    tiers: [0,10000,20000,30000,40000,50000,75000,100000]
    style: relational
    value_format_name: usd_0
    sql:  nvl(f_sql_char_to_numeric(${TABLE}."blue book"),0) ;;
  }

  dimension: advent_dealership {
    description: "The Advent dealership - in June 2019 we consolidated the Wholesale and AutoSport inventory into the Wholesale dealership"
    group_label: "Dealership Info"
    type: string
    sql: nvl(f_sql_adv_dealername(${TABLE}.dealername),'UNKNOWN') ;;
  }

  dimension: Is_active_advent_dealership {
    description: "Used to eliminate the old AutoSport data that was from the initial use of Advent - in June 2019 we consolidated the Wholesale and AutoSport inventory into the Wholesale dealership"
    group_label: "Dealership Info"
    type: yesno
    sql: case when nvl(f_sql_adv_dealername(${TABLE}.dealername),'UNKNOWN') in ('Wholesale','RumbleOn') then 1 else 0 end ;;
  }

  dimension: rumbleon_dealer {
    description: "Identifier for RumbleOn, Wholesale or AutoSport based on the GL Account"
    group_label: "Dealership Info"
    type: string
    sql: nvl(f_sql_adv_inventory_dealership(${TABLE}."gl account"),'UNKNOWN') ;;
  }

  dimension: transit {
    type: string
    sql: ${TABLE}.equipment1 ;;
  }

    dimension: title_info {
    description: "Title info as updated in Equipment 2 field"
    type: string
    sql: ${TABLE}.equipment2 ;;
  }

  dimension: title_state {
    description: "Title info as updated in Equipment 2 field"
    type: string
    sql: f_sql_parse_inv_equipment2_state(${TABLE}.equipment2) ;;
  }

  dimension: title_date_received {
    description: "Title info as updated in Equipment 2 field"
    type: string
    sql: f_sql_parse_inv_equipment2_date(${TABLE}.equipment2) ;;
  }

  dimension: floorplan_info {
    description: "Value from the Equipment 3 field"
    group_label: "Flooring Info"
    type: string
    sql: ${TABLE}.equipment3 ;;
  }


  dimension: gl_account {
    group_label: "GL Related Items"
    type: string
    sql: ${TABLE}."gl account" ;;
  }

  dimension: gl_account_department_id {
    description: "Department based on parsing the GL Account"
    group_label: "GL Related Items"
    type: string
    sql: f_sql_adv_acct_to_department(${gl_account}) ;;
  }

  dimension: gl_account_division_id {
    description: "Division based on parsing the GL Account"
    group_label: "GL Related Items"
    type: string
    sql: f_sql_adv_acct_to_division(${gl_account}) ;;
  }

  dimension: gl_account_location_id {
    description: "Location based on parsing the GL Account"
    group_label: "GL Related Items"
    type: string
    sql: f_sql_adv_acct_to_location(${gl_account}) ;;
  }


  # dimension: grade {
  #   type: string
  #   sql: ${TABLE}.grade ;;
  # }


  dimension: inventory_user_status {
    description:"This is the Inventory Status controlled and updated by RumbleOn"
    type: string
    sql: f_sql_adv_inventory_user_status(${TABLE}.invtstatuscode) ;;
  }


  dimension: inventory_user_status_group {
    description:"This is a grouping the Inventory Status controlled and updated by RumbleOn"
    type: string
    sql: f_sql_adv_inventory_user_status_group(${TABLE}.invtstatuscode) ;;
  }

  dimension: location {
    description:"This current location of the Unit as maintained by RumbleOn"
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: make {
    group_label: "Vehicle Detail"
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: mileage {
    group_label: "Vehicle Detail"
    type: number
    value_format_name: id
    sql: ${TABLE}.mileage ;;
  }

  dimension: mileage_bucket {
    group_label: "Vehicle Detail"
    type: tier
    tiers: [0,5000,10000,15000,20000]
    style: integer
    value_format_name: decimal_0
    sql: ${mileage} ;;
  }

  dimension: model {
    group_label: "Vehicle Detail"
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: inventory_origin {
    type: string
    sql: f_sql_inventory_origin(${TABLE}.orig);;
  }

  dimension: payoff_to {
    type: string
    sql: ${TABLE}."payoff to";;
  }


  dimension: received_from {
    type: string
    sql: ${TABLE}."received_from";;
  }


  dimension_group: date_received {
    type: time
    timeframes: [
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

  dimension_group: in_inventory {
    type: duration
    intervals: [day]
    sql_start: ${TABLE}.recdate ;;
    sql_end: case when status ilike 'sold' then rsstatus else getdate() end;;
  }

  dimension: days_in_inventory_bucket {
    type: tier
    tiers: [0,15,30,45,60]
    style: integer
    value_format_name: decimal_0
    sql: ${days_in_inventory} ;;
  }

  dimension_group: date_rs_status {
    type: time
    timeframes: [
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

  dimension: has_been_rsd {
    type: yesno
    sql: case when ${TABLE}.rsstatus IS NOT NULL then 1 else 0 end ;;
  }


  dimension_group: date_advent_runtime {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."run time" ;;
  }

  dimension: ship {
    type: string
    sql: ${TABLE}.ship ;;
  }

  dimension: status {
    description: "This is the Advent System Status - can only be one of Pending, Current, Sold and Closed.  Pending is Available for Sale but not in GL, Current is Available for Sale and in GL, Sold is Not Available for Sale but Sale not in GL, and Closed is Deal has posted"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: is_available_for_sale {
    description: "Based on the Advent Status code, not the Inventory Status Code that RumbleOn controls "
    type: yesno
    sql: case when status in ('Pending','Current') then 1 else 0 end;;
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
    type:tier
    tiers: [0,5000,15000,20000,25000,35000,50600]
    style: relational
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
    description: "Based on the Advent code - should just be New or Used"
    group_label: "Vehicle Detail"
    type: string
    hidden: yes
    sql: UPPER(${TABLE}.type);;
  }

  dimension: vehicle_type {
    description: "Based on the Advent code - will be Car, Truck or Powersport"
    group_label: "Vehicle Detail"
    type: string
    sql: nvl(f_sql_adv_inventory_vehicle_type(${TABLE}."veh type"),'UNKNOWN') ;;
  }

  dimension: vin {
    type: string
    group_label: "Vehicle Detail"
    sql: ${TABLE}.vin ;;
  }

  dimension: model_year {
    group_label: "Vehicle Detail"
    type: number
    value_format_name: id
    sql: ${TABLE}.year ;;
  }

  dimension: model_year_bucket {
    group_label: "Vehicle Detail"
    type: tier
    tiers: [0,2000,2005,2010,2015,2017,2020]
    style: integer
    value_format_name: id
    sql: ${model_year} ;;
  }

  dimension: is_floorable_mileage {
    group_label: "Flooring Info"
    type: yesno
    sql:${mileage} < 150000 ;;
  }

  dimension: is_floorable_model_year {
    group_label: "Flooring Info"
    type: yesno
    sql: ${model_year} > date_part(year,getdate())-10 ;;
  }

  dimension: is_floorable_status {
    description: "Only considered floorable if not sold"
    group_label: "Flooring Info"
    type: yesno
    sql:${status} in ('Pending','Current') ;;
  }

  dimension: is_floorable {
    group_label: "Flooring Info"
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
    sql:${days_in_inventory};;
  }

  measure: total_blue_book {
    type: sum
    value_format_name: usd_0
    sql: ${blue_book} ;;
  }

}