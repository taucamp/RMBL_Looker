view: adv_sales_adds {
  sql_table_name: public.adv_sales_adds ;;


  set: Sales_Adds {
    fields: [
      deal_number,
      add_type,
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

  dimension: account {
    type: string
    sql: nvl(${TABLE}.account,'Unknown') ;;
  }

  dimension: add_type {
    type: string
    label: "sales_add_type"
    description: "The Type of Sales Add - Accessory, Inventory, Fees"
    sql: nvl(${TABLE}."add type",'Unknown') ;;
  }

  dimension: sales_add_item_code {
    type: string
    label: "sales_add_item code"
    description: "The Item Code of the Sales Add"
    sql: nvl(${TABLE}.code,'Unknown') ;;
  }

  dimension: cost {
    type: number
    label: "sales_add_cost"
    description: "The Cost of the Sales Add"
    value_format_name: usd
    sql: ${TABLE}.cost ;;
  }

  dimension: employee_who_created {
    type: number
#     label:
    description: "The Employee who created the Sales Add"
    sql: nvl(${TABLE}.createempno,0) ;;
  }

  dimension_group: createtimestamp {
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
    sql: ${TABLE}.createtimestamp ;;
  }

  dimension: deal_number {
    type: number
    sql: ${TABLE}."deal number" ;;
  }

  dimension: item_description {
    type: string
    description: "The Detailed Item Description"
    sql: nvl(${TABLE}.description,'Unknown') ;;
  }

  dimension: due_bill {
    type: string
    sql: nvl(${TABLE}."due bill",'Unknown') ;;
  }

  dimension: is_financed {
    type: yesno
    description: "Was the Sales Add Financed"
    sql: nvl(${TABLE}.financed,'No') ;;
  }

  dimension: sales_add_profit_category{
    type: string
    label:"sales_add_profit_category"
    description: "What part of the deal revenue and profit does it fall"
    sql: nvl(${TABLE}."profit where",'Unknown') ;;
  }

  dimension: residual {
    type: number
    label:"sales_add_profit_category"
    description: "Residual Part of the Sales Add"
    value_format_name: usd
    sql: nvl(${TABLE}.residual,0) ;;
  }

  dimension: retail {
    type: number
    description: "Retail value of the Sales Add"
    value_format_name: usd
    sql: nvl${TABLE}.retail,0) ;;
  }

  dimension: is_taxable {
    type: yesno
    sql: nvl(${TABLE}.taxable,'No') ;;
  }

  measure: count {
    type: count
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
