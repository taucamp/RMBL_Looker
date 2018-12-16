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

  measure: total_offer_value {
    type: sum
    sql: ${cash_offer_value}*1 ;;
    value_format_name: usd

  }

}
