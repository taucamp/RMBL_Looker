view: apr_appraisal_offer_status {
  sql_table_name: public.rumble_AprAppraisalOfferStatus ;;

  dimension: appraisal_offer_status_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.AppraisalOfferStatusId ;;
  }


  dimension: appraisal_offer_status {
    type: string
    sql: ${TABLE}.AppraisalOfferStatus ;;
    order_by_field: rank
  }

  dimension_group: created {
    type: time
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: is_active {
    type: number
    hidden: yes
    sql: ${TABLE}.IsActive ;;
  }

  dimension: rank {
    type: number
    hidden: yes
    sql: ${TABLE}.Rank ;;
  }

  dimension_group: updated {
    type: time
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.UpdatedUserId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
