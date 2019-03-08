view: adv_r_salesdetail {
  sql_table_name: public.adv_r_salesdetail ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: sent {
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

  dimension_group: update {
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

  dimension: accessorprofit {
    type: number
    sql: ${TABLE}.accessorprofit ;;
  }

  dimension: amountfinanced {
    type: string
    sql: ${TABLE}.amountfinanced ;;
  }

  dimension: cashdeposit {
    type: number
    sql: ${TABLE}.cashdeposit ;;
  }

  dimension: cashfinanced {
    type: string
    sql: ${TABLE}.cashfinanced ;;
  }

  dimension: cashsaleprice {
    hidden: yes
    type: number
    sql: ${TABLE}.cashsaleprice ;;
  }

  dimension_group: closedate {
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

  dimension: commission {
    type: number
    sql: ${TABLE}.commission ;;
  }

  dimension: ctrlnum {
    type: number
    sql: ${TABLE}.ctrlnum ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: customernum {
    type: string
    sql: ${TABLE}.customernum ;;
  }

  dimension: dealername {
    type: string
    sql: ${TABLE}.dealername ;;
  }

  dimension: dealnum {
    type: number
    sql: ${TABLE}.dealnum ;;
  }

  dimension: dealstatus {
    type: string
    sql: CASE WHEN ${TABLE}.dealstatus = 'CLSD' THEN 'CLOSED' ELSE  ${TABLE}.dealstatus END ;;
  }

  dimension: dlrpack {
    type: number
    sql: ${TABLE}.dlrpack ;;
  }

  dimension: finadds {
    type: number
    sql: ${TABLE}.finadds ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}.guid ;;
  }

  dimension: incentive {
    type: string
    sql: ${TABLE}.incentive ;;
  }

  dimension: lahprofit {
    type: number
    sql: ${TABLE}.lahprofit ;;
  }

  dimension: netprofit {
    type: string
    sql: ${TABLE}.netprofit ;;
  }

  dimension: nontaxableacc {
    type: number
    sql: ${TABLE}.nontaxableacc ;;
  }

  dimension: opportunity {
    type: number
    sql: ${TABLE}.opportunity ;;
  }

  dimension: reserve_profit {
    type: number
    sql: ${TABLE}.reserveprofit ;;
  }

  dimension_group: runtime {
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

  dimension: sellprice {
    type: string
    sql: ${TABLE}.sellprice ;;
  }

  dimension: servicecontractcost {
    type: number
    sql: ${TABLE}.servicecontractcost ;;
  }

  dimension: stocknumber {
    type: string
    sql: ${TABLE}.stocknumber ;;
  }

  dimension: totalsale {
    type: string
    sql: ${TABLE}.totalsale ;;
  }

  dimension: trade1acv {
    type: number
    sql: ${TABLE}.trade1acv ;;
  }

  dimension: trade1gross {
    type: number
    sql: ${TABLE}.trade1gross ;;
  }

  dimension: trade1payoff {
    type: number
    sql: ${TABLE}.trade1payoff ;;
  }

  dimension: trade1stocknum {
    type: string
    sql: ${TABLE}.trade1stocknum ;;
  }

  dimension: trade2acv {
    type: number
    sql: ${TABLE}.trade2acv ;;
  }

  dimension: trade2gross {
    type: number
    sql: ${TABLE}.trade2gross ;;
  }

  dimension: trade2payoff {
    type: number
    sql: ${TABLE}.trade2payoff ;;
  }

  dimension: trade2stocknum {
    type: string
    sql: ${TABLE}.trade2stocknum ;;
  }

  dimension: type {
    type: string
    sql: CASE ${TABLE}.type WHEN '1 RT' THEN 'Retail' WHEN '4 TR' THEN 'Trade' WHEN '6 WH' THEN 'Wholesale' ELSE 'Unknown' END;;
  }

  dimension: vehiclecost {
    type: string
    sql: ${TABLE}.vehiclecost ;;
  }

  dimension: vehicle_profit {
    hidden: yes
    type: number
    sql: ${TABLE}.vehicleprofit ;;
  }

  dimension: vehinsurance {
    type: number
    sql: ${TABLE}.vehinsurance ;;
  }

  dimension: warrantyprofit {
    type: number
    sql: ${TABLE}.warrantyprofit ;;
  }

  dimension: transaction_type {
    type: string
    sql: CASE WHEN ${cashsaleprice} = 0 AND ${trade1gross} > 0 THEN 'Acquisition' ELSE 'Distribution' END ;;
  }

  measure: count_transactions {
    type: count
    drill_fields: [id, dealername]
  }

  measure: total_cash_sale_price {
    type: sum
    sql: ${cashsaleprice} ;;
    value_format_name: usd
    drill_fields: [dealstatus,customer,total_cash_sale_price]
  }

  measure: total_cash_sale_price_distribution {
    type: sum
    sql: ${cashsaleprice} ;;
    filters: {
      field: transaction_type
      value: "Distribution"
    }
  }

  measure: ratio {
    label: "Pct Cash Sales from Distribution"
    type: number
    sql: ${total_cash_sale_price_distribution}*1.0 / nullif(${total_cash_sale_price},0) ;;
    value_format_name: percent_2
  }

  measure: total_vehicle_profit {
    type: sum
    sql: ${vehicle_profit} ;;
    value_format_name: usd
    drill_fields: [dealstatus,customer,total_cash_sale_price]
  }


  measure: pct_of_suggested_retail {
    type: number
    sql: ${total_cash_sale_price}*1.0 / nullif(${adv_r_invtdetail.total_suggested_retail},0) ;;
   }

}
