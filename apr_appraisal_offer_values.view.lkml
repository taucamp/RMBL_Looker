view: apr_appraisal_offer_values {
  sql_table_name: public.rumble_AprAppraisalOfferValues ;;

  set: appraisal_offer_values_drillthrough {
    fields: [cash_offer_value,
      estimated_freight,
      estimated_reconditioning,
      reserve_estimated_margin,
      percentage_of_nada_clean

    ]
  }
  dimension: appraisal_id {
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: appraiser_auction_reserve {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve ;;
  }

  dimension: buy_it_now_est_margin {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin ;;
  }

  dimension: cash_offer_value {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue ;;
  }

  dimension: cash_offer_value_bucket {
  type: tier
  tiers: [0,2500,4000,6000,8000,10000,15000,20000,30000,40000,50000,75000,100000]
  style: relational
  sql: ${cash_offer_value};;
  value_format_name: usd_0

  }

  dimension: consumer_buy_it_now {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow ;;
  }

  dimension: consumer_minimum_bid {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid ;;
  }

  dimension: consumer_reserve {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerReserve ;;
  }

  dimension: estimated_freight {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight ;;
  }

  dimension: estimated_reconditioning {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning ;;
  }

  dimension: percentage_of_nada_clean {
    type: number
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean*1/100 ;;
  }

  dimension: percentage_of_nada_clean_bucket {
    type: tier
    tiers: [0,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2]
    style: relational
    sql: ${percentage_of_nada_clean} ;;
    value_format_name: "0.0\%"
  }

  dimension: reserve_estimated_margin {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin ;;
  }

  dimension: supervisor_action_reserve {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve ;;
  }

  measure: count_of_offers {
    type: count
    value_format_name: decimal_0
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: offer_value_total {
    type: sum
    value_format_name: usd_0
    sql: ${cash_offer_value}*1 ;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: offer_value_average {
    type: average
    value_format_name: usd_0
    sql: ${cash_offer_value}*1 ;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: cash_offer_value
      value: "<>0"
    }
  }

  measure: offer_value_max {
    type: max
    value_format_name: usd_0
    sql: ${cash_offer_value}*1 ;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: offer_value_min {
    type: min
    value_format_name: usd_0
    sql: ${cash_offer_value}*1 ;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: appraiser_auction_reserve_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: appraiser_auction_reserve_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: appraiser_auction_reserve
      value: "<>0"
    }
  }

  measure: appraiser_auction_reserve_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: appraiser_auction_reserve_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: buy_it_now_est_margin_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: buy_it_now_est_margin_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: buy_it_now_est_margin
      value: "<>0"
    }
  }

  measure: buy_it_now_est_margin_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: buy_it_now_est_margin_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }



  measure: cash_offer_value_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: cash_offer_value_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: cash_offer_value
      value: "<>0"
    }
  }

  measure: cash_offer_value_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: cash_offer_value_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }


  measure: consumer_buy_it_now_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: consumer_buy_it_now_average {
    type:average
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: consumer_buy_it_now
      value: "<>0"
    }
  }

  measure: consumer_buy_it_now_max {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: consumer_buy_it_now_min {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: consumer_minimum_bid_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid_total *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: consumer_minimum_bid_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid_total *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: consumer_minimum_bid
      value: "<>0"
    }
  }

  measure: consumer_minimum_bid_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid_total *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: consumer_minimum_bid_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid_total *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: consumer_reserve_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: consumer_reserve_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerReserve *1;;
    filters: {
      field: consumer_reserve
      value: "<>0"
    }
  }

  measure: consumer_reserve_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: consumer_reserve_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: estimated_freight_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: estimated_freight_avg {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: consumer_reserve
      value: "<>0"
    }
  }

  measure: estimated_freight_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: estimated_freight_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

    measure: estimated_reconditioning_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning *1;;
      drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: estimated_reconditioning_avg {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: estimated_reconditioning
      value: "<>0"
    }
  }

  measure: estimated_reconditioning_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: estimated_reconditioning_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: percentage_of_nada_clean_total {
    type: sum
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean *1/100;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: percentage_of_nada_clean_avg {
    type: average
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean *1/100;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: percentage_of_nada_clean
      value: "<>0"
    }
  }

  measure: percentage_of_nada_clean_max {
    type: max
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean *1/100;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: percentage_of_nada_clean_min {
    type: min
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean *1/100;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: reserve_estimated_margin_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: reserve_estimated_margin_avg {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: reserve_estimated_margin
      value: "<>0"
    }
  }

  measure: reserve_estimated_margin_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: reserve_estimated_margin_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: supervisor_action_reserve_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: supervisor_action_reserve_avg {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
    filters: {
      field: supervisor_action_reserve
      value: "<>0"
      }
  }

  measure: supervisor_action_reserve_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

  measure: supervisor_action_reserve_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve *1;;
    drill_fields:[appraisal_offer_values_drillthrough*]
  }

}
