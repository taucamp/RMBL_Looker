view: adv_sales_adds {
  sql_table_name: public.adv_sales_adds ;;


  set: Sales_Adds {
    fields: [
      deal_number,
      sales_add_type,
      sales_add_item_code,
      item_description,
      cost,
      retail,
      residual
      ]
  }

  dimension: id {
    primary_key: yes
    hidden:yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: deal_id {
    type: string
    hidden: yes
    sql: nvl(f_sql_adv_dealername(${TABLE}.store),'UNKNOWN')||'-'||${TABLE}."deal number" ;;
  }


  dimension_group: __senttime {
    hidden:yes
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
    hidden:yes
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

  dimension: payment_account {
    type: string
    sql: nvl(${TABLE}.account,'Unknown') ;;
  }

  dimension: sales_add_type {
    type: string
    label: "Sales Add Type"
    description: "The Type of Sales Add - Accessory, Inventory, Fees"
    sql: nvl(${TABLE}."add type",'Unknown') ;;
  }

  dimension: sales_add_item_code {
    type: string
    label: "Sales Add Item Code"
    description: "The Item Code of the Sales Add"
    sql: nvl(${TABLE}.code,'Unknown') ;;
  }

  dimension: cost {
    hidden:yes
    type: number
    label: "Sales Add Cost"
    description: "The Cost of the Sales Add"
    value_format_name: usd
    sql: ${TABLE}.cost ;;
  }

  dimension: dealer {
    type: number
#     label:
    description: "The Employee who created the Sales Add"
    sql: nvl(f_sql_adv_dealername(${TABLE}.store),'UNKNOWN') ;;
  }

  dimension: employee_who_created {
    type: number
#     label:
    description: "The Employee who created the Sales Add"
    sql: nvl(${TABLE}.createempno,0) ;;
  }

  dimension: employee_who_modified {
    type: number
#     label:
    description: "The Employee who modified the Sales Add"
    sql: nvl(${TABLE}.modifiedemp,0) ;;
  }

  dimension_group: createtimestamp {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      week,
      day_of_week,
      month,
      day_of_month,
      quarter,
      quarter_of_year,
      year,
      day_of_year
    ]
    sql: ${TABLE}.createtimestamp ;;
  }

  dimension_group: modifiedtimestamp {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      week,
      day_of_week,
      month,
      day_of_month,
      quarter,
      quarter_of_year,
      year,
      day_of_year
    ]
    sql: ${TABLE}.modifiedtimestamp ;;
  }

  dimension: deal_number {
    type: number
    sql: ${TABLE}."deal number" ;;
  }

  dimension: sales_add_item {
    type: string
    description: "The Detailed Item Description"
    sql: nvl(${TABLE}.code,'Unk')+'-'+nvl(${TABLE}.description,'Unknown') ;;
  }

  dimension: item_description {
    type: string
    description: "The Detailed Item Description"
    sql: nvl(${TABLE}.description,'Unknown') ;;
  }

  dimension: due_bill {
    type: yesno
    label:"Is Due On Bill"
    sql: case when ${TABLE}."due bill" = 'No' then 0 else 1 end ;;
  }

  dimension: is_financed {
    type: yesno
    description: "Was the Sales Add Financed"
    sql: case when ${TABLE}.financed = 'Yes' then 1 else 0 end ;;
  }

  dimension: sales_add_profit_category{
    type: string
    label:"Sales Add Profit Category"
    description: "What part of the deal revenue and profit does it fall"
    sql: nvl(${TABLE}."profit where",'Unknown') ;;
  }

  dimension: residual {
    hidden:yes
    type: number
    label:"residual_amount"
    description: "Residual Part of the Sales Add"
    value_format_name: usd
    sql: nvl(${TABLE}.residual,0) ;;
  }

  dimension: retail {
    hidden:yes
    type: number
    description: "Retail value of the Sales Add"
    value_format_name: usd
    sql: nvl(${TABLE}.retail,0) ;;
  }

  dimension: is_taxable {
    type: yesno
    sql: case when ${TABLE}.financed = 'Yes' then 1 else 0 end ;;
  }

  measure: count_of_adds {
    type: count
    drill_fields: [Sales_Adds*]
  }

  measure: deals_with_any_adds {
    type: count_distinct
    sql: ${deal_number};;
    drill_fields: [Sales_Adds*]
  }

  measure: deals_with_auction_fees {
    type: count_distinct
    sql: ${deal_number};;
    filters: {
      field: sales_add_item_code
      value: "FEES"
    }
    drill_fields: [Sales_Adds*]
  }

  measure: deals_with_gap {
    type: count_distinct
    sql: ${deal_number};;
    filters: {
      field: sales_add_item_code
      value: "GAP"
    }
    drill_fields: [Sales_Adds*]
  }

  measure: deals_with_inbound_freight {
    type: count_distinct
    sql: ${deal_number};;
    filters: {
      field: sales_add_item_code
      value: "IBFRG"
    }
    drill_fields: [Sales_Adds*]
  }

  measure: deals_with_recon {
    type: count_distinct
    sql: ${deal_number};;
    filters: {
      field: sales_add_item_code
      value: "RECON"
    }
    drill_fields: [Sales_Adds*]
  }

  measure: deals_with_tire {
    type: count_distinct
    sql: ${deal_number};;
    filters: {
      field: sales_add_item_code
      value: "TIRE"
    }
    drill_fields: [Sales_Adds*]
  }

  measure: deals_with_90_warranty{
    type: count_distinct
    sql: ${deal_number};;
    filters: {
      field: sales_add_item_code
      value: "90W"
      }
    drill_fields: [Sales_Adds*]
  }

  measure: total_cost {
    type: sum
    value_format_name:usd_0
    sql: ${cost}*1 ;;
    drill_fields: [Sales_Adds*]
  }
  measure: total_retail {
    type: sum
    value_format_name:usd_0
    sql: ${retail}*1 ;;
    drill_fields: [Sales_Adds*]
  }

  measure: total_residual {
    type: sum
    value_format_name:usd_0
    sql: ${residual}*1 ;;
    drill_fields: [Sales_Adds*]
  }


}
