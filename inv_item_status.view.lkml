view: inv_item_status {
  sql_table_name: public.rumble_InvItemStatus ;;

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

  dimension: item_status_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ItemStatusId ;;
  }

  dimension: listing_status_id {
    type: number
    sql: ${TABLE}.ListingStatusId ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.Rank ;;
  }

  dimension: status_name {
    type: string
    sql: ${TABLE}.StatusName ;;
    order_by_field: rank
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
    drill_fields: [status_name]
  }
}
