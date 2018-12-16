view: apr_appraisal_offer_status {
  sql_table_name: public.rumble_AprAppraisalOfferStatus ;;

  dimension: appraisal_offer_status {
    type: string
    sql: ${TABLE}.AppraisalOfferStatus ;;
    order_by_field: rank
  }

  dimension: appraisal_offer_status_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.AppraisalOfferStatusId ;;
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

  dimension: is_active {
    type: number
    sql: ${TABLE}.IsActive ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.Rank ;;
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
