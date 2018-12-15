view: inv_listing_status {
  sql_table_name: public.rumble_InvListingStatus ;;

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
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  dimension: listing_status {
    type: string
    sql: ${TABLE}.ListingStatus ;;
    order_by_field: rank
  }

  dimension: listing_status_code {
    type: string
    sql: ${TABLE}.ListingStatusCode ;;
  }

  dimension: listing_status_id {
    type: number
    sql: ${TABLE}.ListingStatusId ;;
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
