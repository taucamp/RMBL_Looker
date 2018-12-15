view: apr_item_type {
  sql_table_name: public.rumble_AprItemType ;;

  dimension: created_by {
    type: number
    sql: ${TABLE}.CreatedBy ;;
  }

  dimension_group: creation {
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
    sql: ${TABLE}.CreationDate ;;
  }

  dimension: is_active {
    type: number
    sql: ${TABLE}.IsActive ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.ItemType ;;
    order_by_field: rank
  }

  dimension: item_type_id {
    type: number
    sql: ${TABLE}.ItemTypeId ;;
  }

  dimension: last_updated_by {
    type: number
    sql: ${TABLE}.LastUpdatedBy ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}.LastUpdatedDate ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.Rank ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
