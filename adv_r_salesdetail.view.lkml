view: adv_r_salesdetail {
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
    sql: ${TABLE}.accessorprofit ;;
  }

  dimension: has_accessory_profit {
    type: string
    sql: CASE ${TABLE}.accessorprofit WHEN <> 0 THEN 'YES' ELSE 'NO' END;;
  }



# Amount Finaned
  dimension: amountfinanced {
    hidden: yes
    type: number
    sql: ${TABLE}.amountfinanced ;;
  }

  dimension: has_financing {
    type: string
    sql: CASE ${TABLE}.amountfinanced WHEN <> 0 THEN 'YES' ELSE 'NO' END;;
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
    sql: ${TABLE}.cashdeposit ;;
  }

  dimension: has_cash_deposit {
    type: string
    sql: CASE ${TABLE}.cashdeposit WHEN <> 0 THEN 'YES' ELSE 'NO' END;;
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
    sql: CASE ${TABLE}.cashfinanced WEHN 'C' THEN 'CASH' WHEN 'F' THEN 'FINANCED' ELSE 'UNKNOWN';;
  }



# Cash Sale Price
  dimension: cashsaleprice {
    hidden: yes
    type: number
    sql: ${TABLE}.cashsaleprice ;;
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


# Commission
  dimension: commission {
    hidden: yes
    type: number
    sql: ${TABLE}.commission ;;
  }

  dimension: has_commission {
    type: string
    sql: CASE ${TABLE}.commission WHEN <> 0 THEN 'YES' ELSE 'NO' END;;
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
    sql: CASE WHEN ${TABLE}.dealstatus = 'CLSD' THEN 'CLOSED' ELSE  ${TABLE}.dealstatus END ;;
  }


# Dealer Pack
  dimension: dealerpack {
    hidden: yes
    type: number
    sql: ${TABLE}.dlrpack ;;
  }

  dimension: has_dealer_pack{
    type: string
    sql: CASE ${TABLE}.dealer_pack WHEN <> 0 THEN 'YES' ELSE 'NO' END;;
  }


# Financial Adds
  dimension: finadds {
    hidden: yes
    type: number
    sql: ${TABLE}.finadds ;;
  }

  dimension: has_financial_adds {
    type: string
    sql: CASE ${TABLE}.amountfinanced WHEN <> 0 THEN 'YES' ELSE 'NO' END;;
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
    type: string
    sql: ${TABLE}.incentive ;;
  }


# LAH Profit
  dimension: lahprofit {
    hidden: yes
    type: number
    sql: ${TABLE}.lahprofit ;;
  }


# Net Profit
  dimension: netprofit {
    hidden: yes
    type: string
    sql: ${TABLE}.netprofit ;;
  }


# Non Taxable Accessories
  dimension: nontaxableacc {
    hidden: yes
    type: number
    sql: ${TABLE}.nontaxableacc ;;
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
    sql: ${TABLE}.reserveprofit ;;
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

# Sale Datet
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
    type: string
    sql: ${TABLE}.sellprice ;;
  }

# Service Contracl Cost
  dimension: servicecontractcost {
    hidden: yes
    type: number
    sql: ${TABLE}.servicecontractcost ;;
  }

# Stock Number
  dimension: stocknumber {
    type: string
    sql: ${TABLE}.stocknumber ;;
  }

# Total Sale
  dimension: totalsale {
    hidden: yes
    type: string
    sql: ${TABLE}.totalsale ;;
  }

# Trade 1 ACV
  dimension: trade1acv {
    hidden: yes
    type: number
    sql: ${TABLE}.trade1acv ;;
  }

# Trade 1 Gross
  dimension: trade1gross {
    hidden: yes
    type: number
    sql: ${TABLE}.trade1gross ;;
  }


# Trade 1 Payoff
  dimension: trade1payoff {
    hidden: yes
    type: number
    sql: ${TABLE}.trade1payoff ;;
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
    sql: ${TABLE}.trade2acv ;;
  }

# Trade 2 Gross
  dimension: trade2gross {
    hidden: yes
    type: number
    sql: ${TABLE}.trade2gross ;;
  }

# Trade 2 Payoff
  dimension: trade2payoff {
    hidden: yes
    type: number
    sql: ${TABLE}.trade2payoff ;;
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
    type: string
    sql: ${TABLE}.vehiclecost ;;
  }

# Vehicle Profit
  dimension: vehicleprofit {
    hidden: yes
    type: number
    sql: ${TABLE}.vehicleprofit ;;
  }

# Vehicle Insurance
  dimension: vehinsurance {
    hidden: yes
    type: number
    sql: ${TABLE}.vehinsurance ;;
  }

# Warranty Type
  dimension: warrantyprofit {
    hidden: yes
    type: number
    sql: ${TABLE}.warrantyprofit ;;
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
#   measure: amount_financed {
#     type: sum
#     value_format_name: usd_0
#     sql: ${amountfinanced} ;;
#   }
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
#   measure: commission_amt {
#     type: sum
#     value_format_name: usd_0
#     sql: ${commission} ;;
#   }
#
#   measure: dealer_pack {
#     type: sum
#     value_format_name: usd_0
#     sql: ${dealerpack} ;;
#   }
#
#   measure: financial_adds{
#     type: sum
#     value_format_name: usd_0
#     sql: ${finadds} ;;
#   }
#
#   measure: incentive_amt {
#     type: sum
#     value_format_name: usd_0
#     sql: ${incentive} ;;
#   }
#
#   measure: LAH_Profit {
#     type: sum
#     value_format_name: usd_0
#     sql: ${lahprofit} ;;
#   }
#
#   measure: net_profit {
#     type: sum
#     value_format_name: usd_0
#     sql: ${netprofit} ;;
#   }
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
#   measure: sell_price {
#     type: sum
#     value_format_name: usd_0
#     sql: ${sellprice} ;;
#   }
#
#   measure: service_contract_cost {
#     type: sum
#     value_format_name: usd_0
#     sql: ${servicecontractcost} ;;
#   }
#
#   measure: total_sale {
#     type: sum
#     value_format_name: usd_0
#     sql: ${totalsale} ;;
#   }
#
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
#   measure: vehicle_cost {
#     type: sum
#     value_format_name: usd_0
#     sql: ${vehiclecost} ;;
#   }
#
  measure: vehicle_profit{
    type: sum
    value_format_name: usd_0
    sql: ${vehicleprofit} ;;
  }
#
#   measure: vehicle_insurance {
#     type: sum
#     value_format_name: usd_0
#     sql: ${vehinsurance} ;;
#   }
#
#   measure: warranty_profit {
#     type: sum
#     value_format_name: usd_0
#     sql: ${warrantyprofit} ;;
#   }




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
    sql: ${total_cash_sale_price}*1.0 / nullif(${adv_r_invtdetail.total_suggested_retail},0) ;;
   }

}
