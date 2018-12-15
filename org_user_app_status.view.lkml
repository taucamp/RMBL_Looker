view: org_user_app_status {
  sql_table_name: public.rumble_OrgUserAppStatus ;;

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

  dimension: user_app_status {
    type: string
    sql: ${TABLE}.UserAppStatus ;;
    order_by_field: rank
  }

  dimension: user_app_status_id {
    type: number
    sql: ${TABLE}.UserAppStatusId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
