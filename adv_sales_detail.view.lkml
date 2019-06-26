view: adv_salesdetail {
  derived_table: {
    sql:
    select
      'Sale' as Sale_or_Unwind,
      saledate as Transaction_Date,
        1 as Transaction_Count,
*

    from adv_sales_detail

    union

    select
      'Unwind' as Sale_or_Unwind,
      a.unwinddate as Transaction_Date,
      -1 as Transaction_Count,
b.*


  from adv_sales_unwinds a
    join adv_sales_detail b on a.dealername = b.dealername and a.dealnum = b.dealnum

    ;;
}

  dimension: deal_id {
    primary_key: yes
    type: string
    sql: nvl(f_sql_adv_dealername(${TABLE}.dealername),'UNKNOWN')||'-'||${TABLE}."deal number"||'-'||${TABLE}.Sale_or_Unwind ;;
  }

  dimension: id {
    type: string
    hidden:yes
    sql: ${TABLE}.id ;;
  }

  dimension: Sale_or_Unwind {
    type: string
    sql: ${TABLE}.Sale_or_Unwind ;;
  }

#   dimension_group: sent {
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
#   dimension_group: update {
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



# Accessory Profit
 dimension: accessory_profit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.accessorprofit) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_accessory_profit {
    type: yesno
    sql: ${accessory_profit} > 0;;
  }



# Amount Finaned
  dimension: amount_financed {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.amountfinanced) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_financing {
    type: yesno
    sql: ${amount_financed}<>0;;
  }

  dimension: amount_financed_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000]
    value_format_name: usd_0
    sql: abs(${amount_financed}) ;;
  }



# Cash Deposit
  dimension: cash_deposit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.cashdeposit) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_cash_deposit {
     type: yesno
    sql: ${cash_deposit}<>0;;
  }

  dimension: cash_deposit_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000]
    value_format_name: usd_0
    sql: abs(${cash_deposit}::int) ;;
  }



  # Cash Financed
  dimension: cash_or_financed {
    hidden: yes
    type: string
    sql: CASE WHEN ${TABLE}.cashfinanced  'C' THEN 'CASH' WHEN 'F' THEN 'FINANCED' ELSE 'UNKNOWN' END;;
  }



# Cash Sale Price
  dimension: cash_sale_price {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.cashsaleprice) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: cash_sale_price_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000, 30000,40000,50000,75000,100000,150000,1000000]
    value_format_name: usd_0
    sql: abs(${cash_sale_price}) ;;
  }


# Closee Date
  dimension_group: close_date {
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
    sql: ${TABLE}.closedate ;;
  }

  dimension: has_closed {
    type:  yesno
    sql: nvl2(${close_date_date},1,0) ;;

  }


  dimension_group: days_to_post_deal {
    type: duration
    intervals: [day, week]
    sql_start: ${sale_date} ;;
    sql_end: nvl(${close_date_date}, ${sale_date}) ;;
  }

  dimension_group: days_to_unwind_deal {
    type: duration
    intervals: [day, week]
    sql_start: ${sale_date} ;;
    sql_end: nvl(${close_date_date},${sale_date}) ;;
  }


# Commission
  dimension: commission {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.commission) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_commission {
     type: yesno
    sql: ${commission}<>0;;
  }



# Control Number
  dimension: control_num {
    type: number
    sql: ${TABLE}.ctrlnum ;;
  }


# Customer
  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }


# Customer Number
  dimension: customer_num {
    type: string
    sql: ${TABLE}.customernum ;;
  }


# Dealer Name
  dimension: dealer {
    type: string
    sql: nvl(f_sql_adv_dealername(${TABLE}.dealername),'UNKNOWN') ;;
  }


# Deal Number
  dimension: deal_number {
    type: number
    sql: ${TABLE}.dealnum ;;
  }


# Deal Status
  dimension: deal_status {
    type: string
    sql: CASE WHEN ${TABLE}.dealstatus ilike 'CLSD' THEN 'CLOSED' ELSE  ${TABLE}.dealstatus END ;;
  }


# Dealer Pack
  dimension: dealer_pack {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.dlrpack) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_dealer_pack{
    type: yesno
    sql: ${dealer_pack} <> 0;;
  }

  dimension: sales_channel{
    type: string
    sql: nvl(f_sql_adv_sales_channel(${TABLE}.dept),'UNKNOWN') ;;
  }


# Financial Adds
  dimension: financial_adds {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.finadds) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_financial_adds {
   type: yesno
    sql: ${financial_adds} <> 0;;
  }


  dimension: financial_adds_tier {
    type: tier
    style: integer
    tiers: [0,250,500,1000,2500]
    value_format_name: decimal_0
    sql: abs(${financial_adds}) ;;
  }


# GUID
  dimension: guid {
    hidden: yes
    type: string
    sql: ${TABLE}.guid ;;
  }


# Incentive
  dimension: incentive {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.incentive) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_incentive {
    type: yesno
    sql: ${incentive} <> 0;;
  }


# LAH Profit
  dimension: lah_profit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.lahprofit) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_LAH_incentive {
    type: yesno
    sql: ${lah_profit} <> 0;;
  }

# Net Profit
  dimension: net_profit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql:f_sql_char_to_numeric(${TABLE}.netprofit) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_net_profit {
    type: yesno
    sql: ${net_profit}> 0;;
  }

  dimension: net_profit_tier {
    type: tier
    style: integer
    tiers: [-1000,-500,0,250,500,1000,2500]
    value_format_name: usd_0
    sql: abs(${net_profit}) ;;
  }


# Non Taxable Accessories
  dimension: non_taxable_accessories {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.nontaxableacc) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_non_taxable_accessories {
    type: yesno
    sql: ${non_taxable_accessories} <> 0;;
  }

# Opportunity number
  dimension: opportunity {
    hidden: yes
    type: number
    sql: ${TABLE}.opportunity ;;
  }


# Reserve Profit
  dimension: reserve_profit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.reserveprofit) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_reserve_profit {
    type: yesno
    sql: ${reserve_profit} <> 0;;
  }


# # Run Time
#   dimension_group: runtime {
#     hidden: yes
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
#     sql: ${TABLE}.runtime ;;
#   }

# Sale Date
  dimension_group: sale {
    type: time
    timeframes: [
      raw,
      time,
      day_of_month,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.saledate ;;
  }


#SalespersonID

  dimension: salesperson_id {
    hidden: yes
    type: number
    sql: ${TABLE}.salespersonid ;;
  }

  #Salesperson
  dimension: Salesperson {
    type: string
    value_format_name: usd_0
    sql: nvl(${TABLE}.salesperson1fullnameid,'Unknown');;
    }



# Sell Price
  dimension: sell_price {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.sellprice) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: sell_price_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000,25000,30000,50000,75000,120000,150000]
    value_format_name: usd_0
    sql: abs(${sell_price});;
  }


# Service Contracl Cost
  dimension: service_contract_cost {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.servicecontractcost)  * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_service_contract {
    type: yesno
    sql: ${service_contract_cost} <> 0;;
  }

# Stock Number
  dimension: stock_number {
    type: string
    sql: ${TABLE}.stocknumber ;;
  }

# Stock Number_id
  dimension: stock_number_id {
    type: string
    sql: nvl(f_sql_adv_dealername(${TABLE}.dealername),'UNKNOWN')||'-'||${TABLE}.stocknumber ;;
  }


# Total Sale
  dimension: total_sale {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.totalsale) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: total_sale_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000,25000,30000,50000,75000,120000,150000]
    value_format_name: usd_0
    sql: abs(${total_sale}) ;;
  }

# Trade 1 ACV
  dimension: trade1_acv {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.trade1acv * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }



# Trade 1 Gross
  dimension: trade1_gross {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade1gross) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_trade {
     type: yesno
    sql: ${trade1_gross} <> 0;;
  }


# Trade 1 Payoff
  dimension: trade1_payoff {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade1payoff) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

# Trade 1 Stock number
  dimension: trade1_stock_number {
    type: string
    sql: ${TABLE}.trade1stocknum ;;
  }

# Trade1_Stock Number_id
  dimension: trade1_stock_number_id {
    type: string
    sql: nvl(f_sql_adv_dealername(${TABLE}.store),'UNKNOWN')||'-'||${TABLE}.trade1stocknum ;;
  }

# Trade 2 ACV
  dimension: trade2_acv {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade2acv) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  dimension: has_trades_multiple{
    type: yesno
    sql:  ${TABLE}.trade1gross  <> 0  AND ${TABLE}.trade2gross  <> 0 ;;
  }

# Trade 2 Gross
  dimension: trade2_gross {
    hidden: yes
   type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade2gross) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

# Trade 2 Payoff
  dimension: trade2_payoff {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade2payoff) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

# Trade 2 Stock Number
  dimension: trade2_stock_number {
    type: string
    sql: ${TABLE}.trade2stocknum ;;
  }

# Trade2_Stock Number_id
  dimension: trade2_stock_number_id {
    type: string
    sql: nvl(f_sql_adv_dealername(${TABLE}.store),'UNKNOWN')||'-'||${TABLE}.trade2stocknum ;;
  }

# Deal Type
  dimension: deal_type {
    type: string
    sql: CASE ${TABLE}.type WHEN '1 RT' THEN 'RETAIL' WHEN '4 TR' THEN 'TRADE' WHEN '6 WH' THEN 'WHOLESALE' ELSE 'UNKNOWN' END;;
  }

# Transaction_Date
  dimension_group: transaction_date {
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
    sql: ${TABLE}.transaction_date ;;
  }

# Vehicle Cost
  dimension: vehicle_cost {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.vehiclecost) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

  # Sales Margin Tier
  dimension: sales_margin_tier {
    type: tier
    style: integer
    tiers: [-10000,-5000,-2000,-1000,0,1000,2000,5000,10000]
    value_format_name: usd_0
    sql: ${cash_sale_price} - ${vehicle_cost} ;;
  }


  # Vehicle Cost Tier
  dimension: vehicle_cost_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000,25000,30000,50000,75000,120000,150000]
    value_format_name: usd_0
    sql: abs(${vehicle_cost}) ;;
  }

# Vehicle Profit
  dimension: vehicle_profit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.vehicleprofit) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

 # Vehicle Profit Tier
  dimension: vehicle_profit_tier {
    type: tier
    style: integer
    tiers: [-10000,-5000,-2000,-1000,0,1000,2000,5000,10000]
    value_format_name: usd_0
    sql: abs(${vehicle_profit}) ;;
}


# Vehicle Insurance
  dimension: vehicle_insurance {
    hidden: yes
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.vehinsurance) * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

# Has Vehicle Insurance
    dimension: has_vehicle_insurance {
      type: yesno
      sql: ${vehicle_insurance} <> 0;;
    }

# Warranty Type
  dimension: warranty_profit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.warrantyprofit)  * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
  }

# Has Warranty
    dimension: has_warranty {
      type: yesno
      sql: ${warranty_profit} <> 0;;
    }


# Transaction Type
  dimension: transaction_type {
    type: string
    sql: CASE
          WHEN ${cash_sale_price} > 0 AND ${trade1_gross} = 0 AND ${trade2_gross} = 0  THEN 'SALE ONLY'
          WHEN ${cash_sale_price} > 0 AND ${trade1_gross} > 0 OR ${trade2_gross} > 0 THEN 'SALE WITH TRADE'
          WHEN ${cash_sale_price} = 0 AND ${trade1_gross} > 0 OR ${trade2_gross} > 0 THEN 'ACQUISITION ONLY'
          ELSE 'UNKNOWN' END ;;
  }

# UnwindDate
  dimension_group: unwind {
    type: time
    timeframes: [
      raw,
      time,
      day_of_month,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.unwinddate ;;
  }


# UnwindDate
  dimension: Is_an_unwind {
    type: yesno
    sql: ${TABLE}.Sale_or_Unwind = 'Unwind';;
  }


# MEASURES
# MEASURES
# MEASURES

  measure: count_transactions {
    type: count
    drill_fields: [id, dealer]
  }

  measure: count_net_transactions {
    type: sum
    sql:  1   * case when ${Sale_or_Unwind} = 'Sale' then 1 else -1 end ;;
    drill_fields: [id, dealer]
  }

# Accessory Profit
  measure: accessory_profit_total {
    type: sum
    value_format_name: usd_0
    sql: ${accessory_profit} ;;
  }

  measure: accessory_profit_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  has_accessory_profit
      value: "Yes"
    }
  }

  measure: accessory_profit_avg {
    type: average
    value_format_name: usd_0
    sql: ${accessory_profit} ;;
      filters: {
        field:  has_accessory_profit
        value: "Yes"
      }
  }


#   Amount Financed
  measure: amount_financed_total {
    type: sum
    value_format_name: usd_0
    sql: ${amount_financed} ;;
  }

  measure: amount_financed_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  has_financing
      value: "Yes"
    }
  }
  measure: amount_financed_avg {
    type: average
    value_format_name: usd_0
    sql: ${amount_financed} ;;
    filters: {
      field:  has_financing
      value: "Yes"
    }
  }


#   Cash Deposit
  measure: cash_deposit_total {
    type: sum
    value_format_name: usd_0
    sql: ${cash_deposit} ;;
  }

  measure: cash_deposit_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  has_cash_deposit
      value: "Yes"
    }
  }
  measure: cash_deposit_avg {
    type: average
    value_format_name: usd_0
    sql: ${cash_deposit} ;;
    filters: {
      field:  has_cash_deposit
      value: "Yes"
    }
  }



#   Cash Sale Proice
  measure: cash_sale_price_total{
    type: sum
    value_format_name: usd_0
    sql: ${cash_sale_price} ;;
  }

  measure: cash_sale_price_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  cash_sale_price
      value: "<>0"
    }
  }

  measure: cash_sale_price_avg {
    type: average
    value_format_name: usd_0
    sql: ${cash_sale_price} ;;
    filters: {
      field:  cash_sale_price
      value: "<>0"
    }
  }


# Commission Amount
  measure: commission_total {
    type: sum
    value_format_name: usd_0
    sql: ${commission} ;;
  }

  measure: commisson_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  commission
      value: "<>0"
    }
  }

  measure: commisson_avg {
    type: average
    value_format_name: usd_0
    sql: ${commission} ;;
    filters: {
      field:  commission
      value: "<>0"
    }
  }



# Dealer Pack
  measure: dealer_pack_total {
    type: sum
    value_format_name: usd_0
    sql: ${dealer_pack} ;;

  }

  measure: dealer_pack_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  dealer_pack
      value: "<>0"
    }
  }

  measure: dealer_pack_avg {
    type: average
    value_format_name: usd_0
    sql: ${dealer_pack} ;;
    filters: {
      field:  dealer_pack
      value: "<>0"
    }

  }




# Financial Adds
  measure: financial_adds_total{
    type: sum
    value_format_name: usd_0
    sql: ${financial_adds} ;;
  }

  measure: financial_adds_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  financial_adds
      value: "<>0"
    }
  }

  measure: financial_adds_avg {
    type: average
    value_format_name: usd_0
    sql: ${financial_adds} ;;
    filters: {
      field:  financial_adds
      value: "<>0"
    }
  }



# Incentive Amount
  measure: incentive_total {
    type: sum
    value_format_name: usd_0
    sql: ${incentive};;
  }

# LAH Profit
  measure: LAH_Profit_total {
    type: sum
    value_format_name: usd_0
    sql: ${lah_profit} ;;
  }

  measure: LAH_Profit_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  lah_profit
      value: "<>0"
    }
  }

  measure: LAH_Profit_avg {
    type: average
    value_format_name: usd_0
    sql: ${lah_profit} ;;
    filters: {
      field:  lah_profit
      value: "<>0"
    }
  }




# Net Profit
  measure: net_profit_total {
    type: sum
    value_format_name: usd_0
    sql: ${net_profit} ;;
  }

  measure: net_profit_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  net_profit
      value: "<>0"
    }
  }

  measure: net_profit_avg {
    type: average
    value_format_name: usd_0
    sql: ${net_profit} ;;
    filters: {
      field:  net_profit
      value: "<>0"
    }
  }




# Non Taxable Accessories
  measure: non_taxable_accessories_total {
    type: sum
    value_format_name: usd_0
    sql: ${non_taxable_accessories} ;;
  }

  measure: non_taxable_accessories_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  non_taxable_accessories
      value: "<>0"
    }
  }

  measure: non_taxable_accessorie_avg {
    type: average
    value_format_name: usd_0
    sql: ${non_taxable_accessories} ;;
    filters: {
      field:  non_taxable_accessories
      value: "<>0"
    }
  }


# Reserve Profit
  measure: reserve_profit_total {
    type: sum
    value_format_name: usd_0
    sql: ${reserve_profit} ;;
  }

  measure: reserve_profit_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  reserve_profit
      value: "<>0"
    }
  }

  measure: reserve_profit_avg {
    type: average
    value_format_name: usd_0
    sql: ${reserve_profit} ;;
    filters: {
      field:  reserve_profit
      value: "<>0"
    }
  }


# Sell Price
  measure: sell_price_total {
    type: sum
    value_format_name: usd_0
    sql: ${sell_price};;
  }

  measure: sell_price_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  sell_price
      value: "<>0"
    }
  }

  measure: sell_price_avg {
    type: average
    value_format_name: usd_0
    sql: ${sell_price} ;;
    filters: {
      field:  sell_price
      value: "<>0"
    }
  }

# Service Contract Cost
  measure: service_contract_cost_total {
    type: sum
    value_format_name: usd_0
    sql: ${service_contract_cost} ;;
  }

  measure: service_contract_cost_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  service_contract_cost
      value: "<>0"
    }
  }

  measure: service_contract_cost_avg {
    type: average
    value_format_name: usd_0
    sql: ${service_contract_cost} ;;
    filters: {
      field:  service_contract_cost
      value: "<>0"
    }
  }

# Total Sale
  measure: total_sale_amount {
    type: sum
    value_format_name: usd_0
    sql: ${total_sale};;
  }

  measure: total_sale_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  total_sale
      value: "<>0"
    }
  }

  measure: total_sale_avg {
    type: average
    value_format_name: usd_0
    sql: ${total_sale} ;;
    filters: {
      field:  total_sale
      value: "<>0"
    }
  }


# Trade1 ACV
  measure: trade1_acv_total{
    type: sum
    value_format_name: usd_0
    sql: ${trade1_acv} ;;
  }

  measure: trade1_acv_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  trade1_acv
      value: "<>0"
    }
  }

  measure: trade1_acv_avg {
    type: average
    value_format_name: usd_0
    sql: ${trade1_acv} ;;
    filters: {
      field:  trade1_acv
      value: "<>0"
     }
  }


# Trade1 Gross Total
  measure: trade1_gross_total {
    type: sum
    value_format_name: usd_0
    sql: ${trade1_gross} ;;
  }

  measure: trade1_gross_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  trade1_gross
      value: "<>0"
    }
  }

  measure: trade1_gross_avg {
    type: average
    value_format_name: usd_0
    sql: ${trade1_gross} ;;
    filters: {
      field:  trade1_gross
      value: "<>0"
    }
  }

# Trade1 Payoff
  measure: trade1_payoff_total {
    type: sum
    value_format_name: usd_0
    sql: ${trade1_payoff} ;;
  }

  measure: trade1_payoff_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  trade1_payoff
      value: "<>0"
    }
  }

  measure: trade1_payoff_avg {
    type: average
    value_format_name: usd_0
    sql: ${trade1_payoff} ;;
    filters: {
      field:  trade1_payoff
      value: "<>0"
    }
  }


# Trade2 ACV
  measure: trade2_acv_total{
    type: sum
    value_format_name: usd_0
    sql: ${trade2_acv} ;;
  }

  measure: trade2_acv_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  trade2_acv
      value: "<>0"
    }
  }

  measure: trade2_acv_avg {
    type: average
    value_format_name: usd_0
    sql: ${trade2_acv} ;;
    filters: {
      field:  trade2_acv
      value: "<>0"
     }
  }


# trade2 Gross Total
  measure: trade2_gross_total {
    type: sum
    value_format_name: usd_0
    sql: ${trade2_gross} ;;
  }

  measure: trade2_gross_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  trade2_gross
      value: "<>0"
    }
  }

  measure: trade2_gross_avg {
    type: average
    value_format_name: usd_0
    sql: ${trade2_gross} ;;
    filters: {
      field:  trade2_gross
      value: "<>0"
    }
  }

# trade2 Payoff
  measure: trade2_payoff_total {
    type: sum
    value_format_name: usd_0
    sql: ${trade2_payoff} ;;
  }

  measure: trade2_payoff_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  trade2_payoff
      value: "<>0"
    }
  }

  measure: trade2_payoff_avg {
    type: average
    value_format_name: usd_0
    sql: ${trade2_payoff} ;;
    filters: {
      field:  trade2_payoff
      value: "<>0"
    }
  }


# Vehicle Cost
  measure: vehicle_cost_total {
    type: sum
    value_format_name: usd_0
    sql: ${vehicle_cost};;
  }

  measure: vehicle_cost_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  vehicle_cost
      value: "<>0"
    }
  }

  measure: vehicle_cost_avg {
    type: average
    value_format_name: usd_0
    sql: ${vehicle_cost} ;;
    filters: {
      field:  vehicle_cost
      value: "<>0"
    }
  }


# Vehicle Profit
  measure: vehicle_profit_total{
    type: sum
    value_format_name: usd_0
    sql: ${vehicle_profit} ;;
  }

  measure: vehicle_profit_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  vehicle_profit
      value: "<>0"
    }
  }

  measure: vehicle_profit_avg {
    type: average
    value_format_name: usd_0
    sql: ${vehicle_profit} ;;
    filters: {
      field:  vehicle_profit
      value: "<>0"
    }
  }



# Vehicle Insurance
  measure: vehicle_insurance_total {
    type: sum
    value_format_name: usd_0
    sql: ${vehicle_insurance} ;;
  }

  measure: vehicle_insurance_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  vehicle_insurance
      value: "<>0"
    }
  }

  measure: vehicle_insurance_avg {
    type: average
    value_format_name: usd_0
    sql: ${vehicle_insurance} ;;
    filters: {
      field:  vehicle_insurance
      value: "<>0"
    }
  }


# Warranty Profit
  measure: warranty_profit_amount {
    type: sum
    value_format_name: usd_0
    sql: ${warranty_profit} ;;
  }

  measure: warranty_profit_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  warranty_profit
      value: "<>0"
    }
  }

  measure: warranty_profit_avg {
    type: average
    value_format_name: usd_0
    sql: ${warranty_profit} ;;
    filters: {
      field:  warranty_profit
      value: "<>0"
    }
  }



# Total Cash Sale Price
  measure: total_cash_sale_price {
    type: sum
    value_format_name: usd_0
    sql: ${cash_sale_price} ;;
    drill_fields: [deal_status,customer,total_cash_sale_price]
  }

  measure: total_cash_sale_count {
    type: count
    value_format_name: decimal_0
    filters: {
      field:  cash_sale_price
      value: "<>0"
    }
  }

  measure: total_cash_sale_avg {
    type: average
    value_format_name: usd_0
    sql: ${cash_sale_price} ;;
    filters: {
      field:  cash_sale_price
      value: "<>0"
    }
  }




# Cash Sales from Distribtion
  measure: total_cash_sale_price_distribution {
    type: sum
    value_format_name: usd_0
    sql: ${cash_sale_price} ;;
    filters: {
      field: transaction_type
      value: "SALE ONLY"
    }
    filters: {
      field: transaction_type
      value: "SALE WITH TRADE"
    }
  }

  measure: pct_cash_sales_from_distribution {
    type: number
    value_format_name: percent_1
    sql: ${total_cash_sale_price_distribution}*1.0 / nullif(${total_cash_sale_price},0) ;;

  }

# Vehicle Profit
  measure: total_vehicle_profit {
    type: sum
    value_format_name: usd_0
    sql: ${vehicle_profit} ;;
    drill_fields: [deal_status,customer,total_cash_sale_price]
  }

  measure: total_vehicle_profit_pct {
    type: sum
    value_format_name: percent_1
    sql: ${vehicle_profit}/nullif(${total_sale},0) ;;
    drill_fields: [deal_status,customer,total_cash_sale_price]
  }

#
# Pct of Suggested Retail
  measure: sale_price_as_pct_of_suggested_retail {
    type: number
    value_format_name: percent_2
    sql: ${total_cash_sale_price}*1.0 / nullif(${adv_inventory.total_suggested_retail},0) ;;
   }

#

# Sales Margin
  measure: sales_margin {
    type: number
    description: "This is Cash Sales Price less Vehicle Cost - there are no other Cost included in this"
    value_format_name: usd_0
    sql: ${total_cash_sale_price} - ${vehicle_cost_total} ;;
  }

# # Sales Margin
#   dimension: sales_margin_tier {
#     description: "This is Cash Sales Price less Vehicle Cost - there are no other Cost included in this"
#     type: tier
#     style: integer
#     tiers: [-1000,-500,-250,0,250,500,1000,2500]
#     value_format_name: decimal_0
#     sql: ${total_cash_sale_price}*1.0 - ${vehicle_cost}*1 ;;
#   }

}
