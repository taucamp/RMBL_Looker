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
 dimension: accessorprofit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.accessorprofit) ;;
  }

  dimension: has_accessory_profit {
    type: yesno
    sql: ${accessorprofit} > 0;;
  }



# Amount Finaned
  dimension: amountfinanced {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.amountfinanced) ;;
  }

  dimension: has_financing {
    type: yesno
    sql: ${amountfinanced}<>0;;
  }

  dimension: amount_financed_tier {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000]
    value_format_name: usd_0
    sql: ${amountfinanced} ;;
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
    sql: ${TABLE}.dealername ;;
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
  dimension: dealerpack {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.dlrpack) ;;
  }

  dimension: has_dealer_pack{
    type: yesno
    sql: ${dealerpack} <> 0;;
  }

  dimension: department{
    type: string
    sql: nvl(f_sql_adv_sales_channel${TABLE}.dept),'UNKNOWN') ;;
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
  dimension: lahprofit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.lahprofit) ;;
  }


# Net Profit
  dimension: netprofit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql:f_sql_char_to_numeric(${TABLE}.netprofit) ;;
  }

  dimension: has_net_profit {
    type: yesno
    sql: ${netprofit}> 0;;
  }

  dimension: net_profit_tier {
    type: tier
    style: integer
    tiers: [-1000,-500,0,250,500,1000,2500]
    value_format_name: usd_0
    sql: ${netprofit} ;;
  }


# Non Taxable Accessories
  dimension: nontaxableacc {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.nontaxableacc) ;;
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

# Sell Price
  dimension: sellprice {
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
    sql: ${sellprice};;
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
  dimension: stocknumber {
    type: string
    sql: ${TABLE}.stocknumber ;;
  }

# Total Sale
  dimension: totalsale {
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
    sql: ${totalsale} ;;
  }

# Trade 1 ACV
  dimension: trade1acv {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.trade1acv ;;
  }



# Trade 1 Gross
  dimension: trade1gross {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade1gross) ;;
  }

  dimension: has_trade {
     type: yesno
    sql: ${trade1gross} <> 0;;
  }


# Trade 1 Payoff
  dimension: trade1payoff {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade1payoff) ;;
  }

# Trade 1 Stock number
  dimension: trade1stocknum {
    type: string
    sql: ${TABLE}.trade1stocknum ;;
  }


# Trade 2 ACV
  dimension: trade2acv {
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
  dimension: trade2gross {
    hidden: yes
   type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade2gross) ;;
  }

# Trade 2 Payoff
  dimension: trade2payoff {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.trade2payoff) ;;
  }

# Trade 2 Stock Number
  dimension: trade2stocknum {
    type: string
    sql: ${TABLE}.trade2stocknum ;;
  }

# Deal Type
  dimension: type {
    type: string
    sql: CASE ${TABLE}.type WHEN '1 RT' THEN 'RETAIL' WHEN '4 TR' THEN 'TRADE' WHEN '6 WH' THEN 'WHOLESALE' ELSE 'UNKNOWN' END;;
  }

# Vehicle Cost
  dimension: vehiclecost {
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
    sql: ${vehiclecost} ;;
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
  dimension: vehinsurance {
    hidden: yes
    type: number
    sql: f_sql_char_to_numeric(${TABLE}.vehinsurance) ;;
  }

# Has Vehicle Insurance
    dimension: has_vehicle_insurance {
      type: yesno
      sql: ${vehinsurance} <> 0;;
    }

# Warranty Type
  dimension: warrantyprofit {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: f_sql_char_to_numeric(${TABLE}.warrantyprofit) ;;
  }

# Has Warranty
    dimension: has_warranty {
      type: yesno
      sql: ${warrantyprofit} <> 0;;
    }


# Transaction Type
  dimension: transaction_type {
    type: string
    sql: CASE WHEN ${cashsaleprice} = 0 AND ${trade1gross} > 0 THEN 'ACQUISITION' ELSE 'DISTRIBUTION' END ;;
  }




# MEASURES
# MEASURES
# MEASURES

  measure: count_transactions {
    type: count
    drill_fields: [id, dealer_name]
  }




#   measure: accessory_profit {
#     type: sum
#     value_format_name: usd_0
#     sql: ${accessorprofit} ;;
#   }
#
  measure: amount_financed {
    type: sum
    value_format_name: usd_0
    sql: ${amountfinanced} ;;
  }
#
#   measure: cash_deposit {
#     type: sum
#     value_format_name: usd_0
#     sql: ${cashdeposit} ;;
#   }
#
#    measure: cash_sale_price{
#     type: sum
#     value_format_name: usd_0
#     sql: ${cashsaleprice} ;;
#   }
#
  # measure: commission_amt {
  #   type: sum
  #   value_format_name: usd_0
  #   sql: ${commission} ;;
  # }
#
#   measure: dealer_pack {
#     type: sum
#     value_format_name: usd_0
#     sql: ${dealerpack} ;;
#   }
#
  measure: financial_adds{
    type: sum
    value_format_name: usd_0
    sql: ${finadds} ;;
  }

  # measure: incentive_amt {
  #   type: sum
  #   value_format_name: usd_0
  #   sql: ${incentive};;
  # }
#
#   measure: LAH_Profit {
#     type: sum
#     value_format_name: usd_0
#     sql: ${lahprofit} ;;
#   }
#
  measure: net_profit {
    type: sum
    value_format_name: usd_0
    sql: ${netprofit} ;;
  }
#
#   measure: non_taxable_accessories {
#     type: sum
#     value_format_name: usd_0
#     sql: ${nontaxableacc} ;;
#   }
#
#   measure: reserve_profit {
#     type: sum
#     value_format_name: usd_0
#     sql: ${reserveprofit} ;;
#   }
#
  measure: sell_price {
    type: sum
    value_format_name: usd_0
    sql: ${sellprice};;
  }
#
#   measure: service_contract_cost {
#     type: sum
#     value_format_name: usd_0
#     sql: ${servicecontractcost} ;;
#   }

  measure: total_sale {
    type: sum
    value_format_name: usd_0
    sql: ${totalsale};;
  }

#   measure: trade1_acv{
#     type: sum
#     value_format_name: usd_0
#     sql: ${trade1acv} ;;
#   }
#
#   measure: trade1_gross {
#     type: sum
#     value_format_name: usd_0
#     sql: ${trade1gross} ;;
#   }
#
#   measure: trade1_payoff {
#     type: sum
#     value_format_name: usd_0
#     sql: ${trade1payoff} ;;
#   }
#
#   measure: trade2_acv{
#     type: sum
#     value_format_name: usd_0
#     sql: ${trade2acv} ;;
#   }
#
#   measure: trade2_gross {
#     type: sum
#     value_format_name: usd_0
#     sql: ${trade2gross} ;;
#   }
#
#   measure: trade2_payoff {
#     type: sum
#     value_format_name: usd_0
#     sql: ${trade2payoff} ;;
#   }
#
  measure: vehicle_cost {
    type: sum
    value_format_name: usd_0
    sql: ${vehiclecost};;
  }

  measure: vehicle_profit{
    type: sum
    value_format_name: usd_0
    sql: ${vehicleprofit} ;;
  }
#
  measure: vehicle_insurance {
    type: sum
    value_format_name: usd_0
    sql: ${vehinsurance} ;;
  }

  measure: warranty_profit {
    type: sum
    value_format_name: usd_0
    sql: ${warrantyprofit} ;;
  }




  measure: total_cash_sale_price {
    type: sum
    value_format_name: usd_0
    sql: ${cashsaleprice} ;;
    drill_fields: [deal_status,customer,total_cash_sale_price]
  }

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

  measure: total_vehicle_profit {
    type: sum
    value_format_name: usd_0
    sql: ${vehicleprofit} ;;
    drill_fields: [deal_status,customer,total_cash_sale_price]
  }


  measure: pct_of_suggested_retail {
    type: number
    value_format_name: percent_2
    sql: ${total_cash_sale_price}*1.0 / nullif(${adv_inventory.total_suggested_retail},0) ;;
   }

}
