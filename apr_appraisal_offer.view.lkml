view: apr_appraisal_offer {
  sql_table_name: public.rumble_AprAppraisalOffer ;;

  dimension: appraisal_id {
    type: number
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: appraisal_offer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.AppraisalOfferId ;;
  }

  dimension: appraiser_user_id {
    type: number
    sql: ${TABLE}.AppraiserUserId ;;
  }

  dimension: book_data {
    type: string
    sql: ${TABLE}.BookData ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
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

  dimension: created_user_id {
    type: number
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: extended_count {
    type: number
    sql: ${TABLE}.ExtendedCount ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  dimension: nadaclean {
    type: string
    sql: ${TABLE}.NADAClean ;;
  }

  dimension_group: offer_accepted {
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

  dimension_group: offer_expired {
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

  dimension: offer_price {
    type: number
    sql: ${TABLE}.OfferPrice ;;
  }

  dimension_group: offer_released {
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

  dimension: offer_status_id {
    type: number
    sql: ${TABLE}.OfferStatusId ;;
  }

  dimension: offer_type_id {
    type: number
    sql: ${TABLE}.OfferTypeId ;;
  }

  dimension: offered_to_user_id {
    type: number
    sql: ${TABLE}.OfferedToUserId ;;
  }

  dimension: purchase_id {
    type: number
    sql: ${TABLE}.PurchaseId ;;
  }

  dimension: supervisor_user_id {
    type: number
    sql: ${TABLE}.SupervisorUserId ;;
  }

  dimension_group: updated {
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

  dimension: updated_user_id {
    type: number
    sql: ${TABLE}.UpdatedUserId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
