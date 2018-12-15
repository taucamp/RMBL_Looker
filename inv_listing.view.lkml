view: inv_listing {
  sql_table_name: public.rumble_InvListing ;;

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

  dimension: event_id {
    type: number
    sql: ${TABLE}.EventId ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.ItemId ;;
  }

  dimension: listing_id {
    type: number
    sql: ${TABLE}.ListingId ;;
  }

  dimension: listing_status_id {
    type: number
    sql: ${TABLE}.ListingStatusId ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.Notes ;;
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
