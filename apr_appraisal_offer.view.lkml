view: apr_appraisal_offer {
  sql_table_name: public.rumble_AprAppraisalOffer ;;

  dimension: appraisal_id {
    type: number
    hidden: yes
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: appraisal_offer_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.AppraisalOfferId ;;
  }

  dimension: appraiser_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.AppraiserUserId,0) ;;
  }

  dimension: book_data {
    type: string
    hidden: yes
    sql: ${TABLE}.BookData ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.CampaignId,0) ;;
  }

  dimension: consignment_price {
    type: number
    sql: ${TABLE}.ConsignmentPrice ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CreatedDate ;;
  }


  dimension: is_created {
    type: yesno
    sql: nvl2(${TABLE}.CreatedDate,1,0) = 1 ;;
  }


  dimension: created_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.CreatedUserId,0 ;;
  }

  dimension: extended_count {
    type: number
    sql: ${TABLE}.ExtendedCount ;;
  }

  dimension: is_active {
    type: string
    hidden: yes
    sql: ${TABLE}.IsActive ;;
  }

  dimension: nadaclean {
    type: string
    hidden: yes
    sql: ${TABLE}.NADAClean ;;
  }

  dimension_group: offer_accepted {
    group_label:"Dates"
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
    sql: ${TABLE}.OfferAcceptedDate ;;
  }


  dimension: is_accepted {
    type: yesno
    sql: nvl2(${TABLE}.OfferAcceptedDate,1,0) = 1 ;;
  }

  dimension_group: offer_expired {
    group_label:"Dates"
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
    sql: ${TABLE}.OfferExpiredDate ;;
  }

  dimension: is_expired {
    type: yesno
    sql: nvl2(${TABLE}.OfferExpiredDate,1,0) = 1 ;;
  }

  dimension: offer_price {
    type: number
    hidden: yes
    sql: ${TABLE}.OfferPrice ;;
  }

  dimension: offer_price_bucket {
    type: tier
    tiers: [0,2500,4000,6000,8000,10000,15000,20000,30000,40000,50000,75000,100000]
    style: relational
    sql: ${offer_price} ;;
    value_format_name: usd_0
  }

  dimension_group: offer_released {
    group_label:"Dates"
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
    sql: ${TABLE}.OfferReleasedDate ;;
  }

  dimension: is_released {
    type: yesno
    sql: nvl2(${TABLE}.OfferReleasedDate,1,0) = 1 ;;
  }

  dimension: offer_status_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.OfferStatusId,0) ;;
  }

#   dimension: offer_type_id {
#     type: number
#     sql: nvl(${TABLE}.OfferTypeId,0) ;;
#   }

  dimension: offered_to_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.OfferedToUserId,0) ;;
  }

  dimension: purchase_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.PurchaseId,0) ;;
  }

  dimension: supervisor_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.SupervisorUserId,0) ;;
  }

  dimension_group: updated {
    group_label:"Dates"
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
    sql: ${TABLE}.UpdatedDate ;;
  }

  dimension: is_updated {
    type: yesno
    sql: nvl2(${TABLE}.UpdatedDate,1,0) = 1 ;;
  }

  dimension: updated_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.UpdatedUserId,0) ;;
  }






# DURATION METRICS
  dimension_group: between_created_and_released {
    type: duration
    group_label:"Time v"
    intervals:[day, hour, minute]
    sql_start: ${created_raw};;
    sql_end: nvl(${offer_released_raw},${created_raw});;

  }


  dimension_group: between_created_and_accepted {
    type: duration
    group_label:"Time between_created_and_accepted"
    intervals:[day, hour, minute]
    sql_start: ${created_raw};;
    sql_end: nvl(${offer_accepted_raw},${created_raw});;

  }

  dimension_group: between_created_and_expired {
    type: duration
    group_label:"Time between_created_and_expired"
    intervals:[day, hour, minute]
    sql_start: ${created_raw};;
    sql_end: nvl(${offer_expired_raw},${created_raw});;

  }


  dimension_group: between_released_and_accepted {
    type: duration
    group_label:"Time between_released_and_accepted"
    intervals:[day, hour, minute]
    sql_start: ${offer_released_raw};;
    sql_end: nvl(${offer_accepted_raw},${offer_released_raw});;

  }

  dimension_group: between_released_and_expired {
    type: duration
    group_label:"Time between_released_and_expired"
    intervals:[day, hour, minute]
    sql_start: ${offer_released_raw};;
    sql_end: nvl(${offer_expired_raw},${offer_released_raw});;

  }

  # MEASURES


  measure: count {
    type: count
    drill_fields: []
  }

  measure: consignment_price_total {
    type:  sum
    sql: ${consignment_price} ;;
  }

  measure: consignment_price_average {
    type:  average
    sql: ${consignment_price}*1;;
      filters: {
        field: consignment_price
        value: "<>0"
      }
  }

  measure: consignment_price_max {
    type:  max
    sql: ${consignment_price}*1;;
    filters: {
      field: consignment_price
      value: "<>0"
    }
  }

  measure: consignment_price_min {
    type:  average
    sql: ${consignment_price}*1;;
    filters: {
      field: consignment_price
      value: "<>0"
    }
  }
  measure: nadaclean_total {
    type:  sum
    sql: ${nadaclean}*1 ;;
  }

  measure: nadaclean_average {
    type:  average
    sql: ${nadaclean}*1;;
    filters: {
      field: nadaclean
      value: "<>0"
    }
  }

  measure: nadaclean_max {
    type:  max
    sql: ${nadaclean}*1;;
    filters: {
      field: nadaclean
      value: "<>0"
    }
  }
  measure: nadaclean_min {
    type:  min
    sql: ${nadaclean}*1;;
    filters: {
      field: nadaclean
      value: "<>0"
    }
  }

  measure: offer_price_total {
    type:  sum
    sql: ${offer_price}*1 ;;
  }

  measure: offer_price_average {
    type:  average
    sql: ${offer_price}*1;;
    filters: {
      field: offer_price
      value: "<>0"
    }
  }

  measure: offer_price_max {
    type:  max
    sql: ${offer_price}*1;;
    filters: {
      field: offer_price
      value: "<>0"
    }
  }
  measure: offer_price_min {
    type:  min
    sql: ${offer_price}*1;;
    filters: {
      field: offer_price
      value: "<>0"
    }
  }

}
