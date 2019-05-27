view: inv_listing {
  sql_table_name: public.rumble_InvListing ;;

  dimension: listing_id {
    primary_key: yes
    type: number
    hidden:yes
    sql: ${TABLE}.ListingId ;;
  }

  dimension_group: created {
    type: time
    hidden:yes
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
    hidden:yes
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: event_id {
    type: number
    hidden:yes
    sql: ${TABLE}.EventId ;;
  }

  dimension: item_id {
    type: number
    hidden:yes
    sql: ${TABLE}.ItemId ;;
  }

   dimension: listing_status_id {
    type: number
    hidden:yes
    sql: ${TABLE}.ListingStatusId ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.Notes ;;
  }

  dimension_group: updated {
    type: time
    hidden:yes
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
    hidden:yes
    sql: ${TABLE}.UpdatedUserId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
