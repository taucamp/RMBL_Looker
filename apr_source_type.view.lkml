view: apr_source_type {
  sql_table_name: public.rumble_AprSourceType ;;

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

  dimension: source_type {
    type: string
    sql: ${TABLE}.SourceType ;;
    order_by_field: rank
  }

  dimension: source_type_id {
    type: number
    sql: ${TABLE}.SourceTypeId ;;
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
