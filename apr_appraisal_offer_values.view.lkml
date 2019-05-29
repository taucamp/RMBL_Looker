view: apr_appraisal_offer_values {
  sql_table_name: public.rumble_AprAppraisalOfferValues ;;

  dimension: appraisal_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: appraiser_auction_reserve {
    type: number
    sql: ${TABLE}.AppraiserAuctionReserve ;;
  }

  dimension: buy_it_now_est_margin {
    type: number
    sql: ${TABLE}.BuyItNowEstMargin ;;
  }

  dimension: cash_offer_value {
    type: number
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
    sql: ${TABLE}.ConsumerBuyItNow ;;
  }

  dimension: consumer_minimum_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ConsumerMinimumBid ;;
  }

  dimension: consumer_reserve {
    type: number
    sql: ${TABLE}.ConsumerReserve ;;
  }

  dimension: estimated_freight {
    type: number
    sql: ${TABLE}.EstimatedFreight ;;
  }

  dimension: estimated_reconditioning {
    type: number
    sql: ${TABLE}.EstimatedReconditioning ;;
  }

  dimension: percentage_of_nada_clean {
    type: number
    sql: ${TABLE}.PercentageOfNadaClean ;;
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
    sql: ${TABLE}.ReserveEstimatedMargin ;;
  }

  dimension: supervisor_action_reserve {
    type: number
    sql: ${TABLE}.SupervisorActionReserve ;;
  }

  measure: count_of_offers {
    type: count
    value_format_name: decimal_0
  }

  measure: offer_value_total {
    type: sum
    value_format_name: usd_0
    sql: ${cash_offer_value}*1 ;;
  }

  measure: offer_value_average {
    type: average
    value_format_name: usd_0
    sql: ${cash_offer_value}*1 ;;
  }

  measure: offer_value_max {
    type: max
    value_format_name: usd_0
    sql: ${cash_offer_value}*1 ;;
  }

  measure: offer_value_min {
    type: min
    value_format_name: usd_0
    sql: ${cash_offer_value}*1 ;;
  }

  measure: appraiser_auction_reserve_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve *1;;
  }

  measure: appraiser_auction_reserve_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve *1;;
    filters: {
      field: appraiser_auction_reserve
      value: "<>0"
    }
  }

  measure: appraiser_auction_reserve_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve *1;;
  }

  measure: appraiser_auction_reserve_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.AppraiserAuctionReserve *1;;
  }

  measure: buy_it_now_est_margin_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin *1;;
  }

  measure: buy_it_now_est_margin_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin *1;;
    filters: {
      field: buy_it_now_est_margin
      value: "<>0"
    }
  }

  measure: buy_it_now_est_margin_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin *1;;
  }

  measure: buy_it_now_est_margin_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.BuyItNowEstMargin *1;;
  }



  measure: cash_offer_value_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue *1;;
  }

  measure: cash_offer_value_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue *1;;
    filters: {
      field: cash_offer_value
      value: "<>0"
    }
  }

  measure: cash_offer_value_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue *1;;
  }

  measure: cash_offer_value_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.CashOfferValue *1;;
  }


  measure: consumer_buy_it_now_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow *1;;
  }

  measure: consumer_buy_it_now_average {
    type:average
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow *1;;
    filters: {
      field: consumer_buy_it_now
      value: "<>0"
    }
  }

  measure: consumer_buy_it_now_max {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow *1;;
  }

  measure: consumer_buy_it_now_min {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerBuyItNow *1;;
  }

  measure: consumer_minimum_bid_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid_total *1;;
  }

  measure: consumer_minimum_bid_average {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid_total *1;;
    filters: {
      field: consumer_minimum_bid
      value: "<>0"
    }
  }

  measure: consumer_minimum_bid_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid_total *1;;
  }

  measure: consumer_minimum_bid_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerMinimumBid_total *1;;
  }

  measure: consumer_reserve_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerReserve *1;;
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
  }

  measure: consumer_reserve_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.ConsumerReserve *1;;
  }

  measure: estimated_freight_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight *1;;
  }

  measure: estimated_freight_avg {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight *1;;
    filters: {
      field: consumer_reserve
      value: "<>0"
    }
  }

  measure: estimated_freight_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight *1;;
  }

  measure: estimated_freight_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedFreight *1;;
  }

    measure: estimated_reconditioning_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning *1;;
  }

  measure: estimated_reconditioning_avg {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning *1;;
    filters: {
      field: estimated_reconditioning
      value: "<>0"
    }
  }

  measure: estimated_reconditioning_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning *1;;
  }

  measure: estimated_reconditioning_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.EstimatedReconditioning *1;;
  }

  measure: percentage_of_nada_clean_total {
    type: sum
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean *1/100;;
  }

  measure: percentage_of_nada_clean_avg {
    type: average
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean *1/100;;
    filters: {
      field: percentage_of_nada_clean
      value: "<>0"
    }
  }

  measure: percentage_of_nada_clean_max {
    type: max
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean *1/100;;
  }

  measure: percentage_of_nada_clean_min {
    type: min
    value_format_name: percent_1
    sql: ${TABLE}.PercentageOfNadaClean *1/100;;
  }

  measure: reserve_estimated_margin_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin *1;;
  }

  measure: reserve_estimated_margin_avg {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin *1;;
    filters: {
      field: reserve_estimated_margin
      value: "<>0"
    }
  }

  measure: reserve_estimated_margin_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin *1;;
  }

  measure: reserve_estimated_margin_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.ReserveEstimatedMargin *1;;
  }

  measure: supervisor_action_reserve_total {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve *1;;
  }

  measure: supervisor_action_reserve_avg {
    type: average
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve *1;;
    filters: {
      field: supervisor_action_reserve
      value: "<>0"
      }
  }

  measure: supervisor_action_reserve_max {
    type: max
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve *1;;
  }

  measure: supervisor_action_reserve_min {
    type: min
    value_format_name: usd_0
    sql: ${TABLE}.SupervisorActionReserve *1;;
  }

}
