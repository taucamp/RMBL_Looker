view: inv_auction_status {
  sql_table_name: public.rumble_InvAuctionStatus ;;

  dimension: auction_status {
    type: string
    sql: ${TABLE}.AuctionStatus ;;
    order_by_field: rank
  }

  dimension: auction_status_code {
    type: number
    sql: ${TABLE}.AuctionStatusCode ;;
  }

  dimension: auction_status_id {
    type: number
    sql: ${TABLE}.AuctionStatusId ;;
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
    type: string
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
