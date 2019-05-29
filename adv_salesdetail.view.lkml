view: adv_salesdetail {
  sql_table_name: public.adv_r_salesdetail ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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
    sql: f_sql_char_to_numeric(${TABLE}.accessorprofit) ;;
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
    sql: f_sql_char_to_numeric(${TABLE}.amountfinanced) ;;
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
    sql: ${amount_financed} ;;
  }



# Cash Deposit
  dimension: cashdeposit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.cashdeposit) ;;
  }

  dimension: has_cash_deposit {
     type: yesno
    sql: ${cashdeposit}<>0;;
  }

  dimension: cash_deposit_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000]
    value_format_name: usd_0
    sql: ${cashdeposit}::int ;;
  }



  # Cash Financed
  dimension: cash_or_financed {
    hidden: yes
    type: string
    sql: CASE WHEN ${TABLE}.cashfinanced  'C' THEN 'CASH' WHEN 'F' THEN 'FINANCED' ELSE 'UNKNOWN' END;;
  }



# Cash Sale Price
  dimension: cashsaleprice {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.cashsaleprice) ;;
  }

  dimension: cash_sale_price_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000, 30000,40000,50000,75000,100000,150000,1000000]
    value_format_name: usd_0
    sql: ${cashsaleprice} ;;
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
    sql_end: ${close_date_date} ;;
  }


# Commission
  dimension: commission {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.commission) ;;
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
  dimension: dealer_name {
    type: string
    sql: f_sql_adv_dealername(${TABLE}.dealername) ;;
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
    sql: f_sql_char_to_numeric(${TABLE}.dlrpack) ;;
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
  dimension: finadds {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.finadds) ;;
  }

  dimension: has_financial_adds {
   type: yesno
    sql: ${finadds} <> 0;;
  }


  dimension: financial_adds_tier {
    type: tier
    style: integer
    tiers: [0,250,500,1000,2500]
    value_format_name: decimal_0
    sql: ${finadds} ;;
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
    sql: f_sql_char_to_numeric(${TABLE}.incentive) ;;
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
    sql: f_sql_char_to_numeric(${TABLE}.lahprofit) ;;
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
    sql:f_sql_char_to_numeric(${TABLE}.netprofit) ;;
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
    sql: ${net_profit} ;;
  }


# Non Taxable Accessories
  dimension: non_taxable_accessories {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.nontaxableacc) ;;
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
  dimension: reserveprofit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.reserveprofit) ;;
  }

  dimension: has_reserve_profit {
    type: yesno
    sql: ${reserveprofit} <> 0;;
  }


# Run Time
  dimension_group: runtime {
    hidden: yes
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
    sql: ${TABLE}.runtime ;;
  }

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
    sql: f_sql_char_to_numeric(${TABLE}.sellprice) ;;
  }

  dimension: sell_price_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000,25000,30000,50000,75000,120000,150000]
    value_format_name: usd_0
    sql: ${sell_price};;
  }


# Service Contracl Cost
  dimension: servicecontractcost {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.servicecontractcost) ;;
  }

  dimension: has_service_contract {
    type: yesno
    sql: ${servicecontractcost} <> 0;;
  }

# Stock Number
  dimension: stock_number {
    type: string
    sql: ${TABLE}.stocknumber ;;
  }

# Total Sale
  dimension: total_sale {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.totalsale) ;;
  }

  dimension: total_sale_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000,25000,30000,50000,75000,120000,150000]
    value_format_name: usd_0
    sql: ${total_sale} ;;
  }

# Trade 1 ACV
  dimension: trade1_acv {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.trade1acv ;;
  }



# Trade 1 Gross
  dimension: trade1_gross {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade1gross) ;;
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
    sql: f_sql_char_to_numeric(${TABLE}.trade1payoff) ;;
  }

# Trade 1 Stock number
  dimension: trade1_stock_number {
    type: string
    sql: ${TABLE}.trade1stocknum ;;
  }


# Trade 2 ACV
  dimension: trade2_acv {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade2acv) ;;
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
    sql: f_sql_char_to_numeric(${TABLE}.trade2gross) ;;
  }

# Trade 2 Payoff
  dimension: trade2_payoff {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade2payoff) ;;
  }

# Trade 2 Stock Number
  dimension: trade2_stock_number {
    type: string
    sql: ${TABLE}.trade2stocknum ;;
  }

# Deal Type
  dimension: deal_type {
    type: string
    sql: CASE ${TABLE}.type WHEN '1 RT' THEN 'RETAIL' WHEN '4 TR' THEN 'TRADE' WHEN '6 WH' THEN 'WHOLESALE' ELSE 'UNKNOWN' END;;
  }

# Vehicle Cost
  dimension: vehicle_cost {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.vehiclecost) ;;
  }

  # Vehicle Profit
  dimension: vehicle_cost_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000,25000,30000,50000,75000,120000,150000]
    value_format_name: usd_0
    sql: ${vehicle_cost} ;;
  }

# Vehicle Profit
  dimension: vehicleprofit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.vehicleprofit) ;;
  }

 # Vehicle Profit Tier
  dimension: vehicle_profit_tier {
    type: tier
    style: integer
    tiers: [-10000,-5000,-2000,-1000,0,1000,2000,5000,10000]
    value_format_name: usd_0
    sql: ${vehicleprofit} ;;
}


# Vehicle Insurance
  dimension: vehicle_insurance {
    hidden: yes
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.vehinsurance) ;;
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
    sql: f_sql_char_to_numeric(${TABLE}.warrantyprofit) ;;
  }

# Has Warranty
    dimension: has_warranty {
      type: yesno
      sql: ${warranty_profit} <> 0;;
    }


# Transaction Type
  dimension: transaction_type {
    type: string
    sql: CASE WHEN ${cashsaleprice} = 0 AND ${trade1_gross} > 0 THEN 'ACQUISITION' ELSE 'DISTRIBUTION' END ;;
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
    sql: nvl2(${TABLE}.unwinddate,0,1) = 1;;
  }


# MEASURES
# MEASURES
# MEASURES

  measure: count_transactions {
    type: count
    drill_fields: [id, dealer_name]
  }

# Accessory Profit
  measure: accessory_profit_total {
    type: sum
    value_format_name: usd_0
    sql: ${accessory_profit}profit} ;;
  }

  measure: accessory_profit_count {
    type: count
    value_format_name: usd_0
    sql: ${accessory_profit} ;;
    filters: {
      field:  has_accessory_profit
      value: "1"
    }
  }

  measure: accessory_profit_avg {
    type: average
    value_format_name: usd_0
    sql: ${accessory_profit} ;;
      filters: {
        field:  has_accessory_profit
        value: "1"
      }
  }


#   Amount Financed
  measure: amount_financed_total {
    type: sum
    value_format_name: usd_0
    sql: ${amount_financed} ;;
  }

  measure: amount_financed_avg {
    type: average
    value_format_name: usd_0
    sql: ${amount_financed} ;;
    filters: {
      field:  has_financing
      value: "1"
    }
  }


#   Cash Deposit
  measure: cash_deposit {
    type: sum
    value_format_name: usd_0
    sql: ${cashdeposit} ;;
  }

  measure: cash_deposit_avg {
    type: average
    value_format_name: usd_0
    sql: ${cash_deposit} ;;
    filters: {
      field:  has_cash_deposit
      value: "1"
    }
  }



#   Cash Sale Proice
  measure: cash_sale_price{
    type: sum
    value_format_name: usd_0
    sql: ${cashsaleprice} ;;
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
  measure: commission_amt {
    type: sum
    value_format_name: usd_0
    sql: ${commission} ;;
  }

# Dealer Pack
  measure: dealer_pack_total {
    type: sum
    value_format_name: usd_0
    sql: ${dealer_pack} ;;
  }


# Financial Adds
  measure: financial_adds{
    type: sum
    value_format_name: usd_0
    sql: ${finadds} ;;
  }

# Incentive Amount
  measure: incentive_amt {
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


# Net Profit
  measure: net_profit_total {
    type: sum
    value_format_name: usd_0
    sql: ${net_profit} ;;
  }


# Non Taxable Accessories
  measure: non_taxable_accessories_total {
    type: sum
    value_format_name: usd_0
    sql: ${non_taxable_accessories} ;;
  }

# Reserve Profit
  measure: reserve_profit {
    type: sum
    value_format_name: usd_0
    sql: ${reserveprofit} ;;
  }

# Sell Price
  measure: sell_price_total {
    type: sum
    value_format_name: usd_0
    sql: ${sell_price};;
  }

# Service Contract Cost
  measure: service_contract_cost_total {
    type: sum
    value_format_name: usd_0
    sql: ${servicecontractcost} ;;
  }

# Total Sale
  measure: total_sale_amout {
    type: sum
    value_format_name: usd_0
    sql: ${total_sale};;
  }

# Trade1 ACV
  measure: trade1_acv_total{
    type: sum
    value_format_name: usd_0
    sql: ${trade1_acv} ;;
  }

# Trade1 Gross Total
  measure: trade1_gross_total {
    type: sum
    value_format_name: usd_0
    sql: ${trade1_gross} ;;
  }

# Trade1 Payoff
  measure: trade1_payoff_total {
    type: sum
    value_format_name: usd_0
    sql: ${trade1_payoff} ;;
  }

# Trade 2 ACV
  measure: trade2_acv_total{
    type: sum
    value_format_name: usd_0
    sql: ${trade2_acv} ;;
  }

# Trade 2 Gross
  measure: trade2_gross_total {
    type: sum
    value_format_name: usd_0
    sql: ${trade2_gross} ;;
  }

# Trade2 Payoff
  measure: trade2_payoff_total {
    type: sum
    value_format_name: usd_0
    sql: ${trade2_payoff} ;;
  }

# Vehicle Cost
  measure: vehicle_cost_amount {
    type: sum
    value_format_name: usd_0
    sql: ${vehicle_cost};;
  }

# Vehicle Profit
  measure: vehicle_profit{
    type: sum
    value_format_name: usd_0
    sql: ${vehicleprofit} ;;
  }

# Vehicle Insurance
  measure: vehicle_insurance_amount {
    type: sum
    value_format_name: usd_0
    sql: ${vehicle_insurance} ;;
  }

# Warranty Profit
  measure: warranty_profit_amount {
    type: sum
    value_format_name: usd_0
    sql: ${warranty_profit} ;;
  }

# Total Cash Sale Price
  measure: total_cash_sale_price {
    type: sum
    value_format_name: usd_0
    sql: ${cashsaleprice} ;;
    drill_fields: [deal_status,customer,total_cash_sale_price]
  }

# Cash Sales from Distribtion
  measure: total_cash_sale_price_distribution {
    type: sum
    value_format_name: usd_0
    sql: ${cashsaleprice} ;;
    filters: {
      field: transaction_type
      value: "DISTRIBUTION"
    }
  }

  measure: ratio {
    label: "Pct Cash Sales from Distribution"
    type: number
    value_format_name: percent_2
    sql: ${total_cash_sale_price_distribution}*1.0 / nullif(${total_cash_sale_price},0) ;;

  }

# Vehicle Profit
  measure: total_vehicle_profit {
    type: sum
    value_format_name: usd_0
    sql: ${vehicleprofit} ;;
    drill_fields: [deal_status,customer,total_cash_sale_price]
  }
#
# Pct of Suggested Retail
  measure: pct_of_suggested_retail {
    type: number
    value_format_name: percent_2
    sql: ${total_cash_sale_price}*1.0 / nullif(${adv_inventory.total_suggested_retail},0) ;;
   }

}
