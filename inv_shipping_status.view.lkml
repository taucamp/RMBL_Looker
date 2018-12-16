view: inv_shipping_status {
  sql_table_name: public.rumble_InvShippingStatus ;;

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

  dimension: shipping_code {
    type: string
    sql: ${TABLE}.ShippingCode ;;
  }

  dimension: shipping_status {
    type: string
    sql: ${TABLE}.ShippingStatus ;;
    order_by_field: rank
  }

  dimension: shipping_status_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ShippingStatusId ;;
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
