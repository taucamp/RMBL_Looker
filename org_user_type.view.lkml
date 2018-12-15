view: org_user_type {
  sql_table_name: public.rumble_OrgUserType ;;

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

  dimension: user_type {
    type: string
    sql: ${TABLE}.UserType ;;
    order_by_field: rank
  }

  dimension: user_type_id {
    type: number
    sql: ${TABLE}.UserTypeId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
