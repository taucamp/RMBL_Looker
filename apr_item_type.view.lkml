view: apr_item_type {
  sql_table_name: public.rumble_AprItemType ;;

  dimension: item_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ItemTypeId ;;
  }

  dimension: created_by {
    type: number
    hidden: yes
    sql: ${TABLE}.CreatedBy ;;
  }

  dimension_group: creation {
    type: time
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.IsActive ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.ItemType ;;
    order_by_field: rank
  }

  dimension: last_updated_by {
    type: number
    hidden: yes
    sql: ${TABLE}.LastUpdatedBy ;;
  }

  dimension_group: last_updated {
    type: time
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.Rank ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
