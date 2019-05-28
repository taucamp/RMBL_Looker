view: apr_physical_condition {
  sql_table_name: public.rumble_AprPhysicalCondition ;;

  dimension: physical_condition_id {
    primary_key: yes
    type: number
    hidden:yes
    sql: isnull(${TABLE}.PhysicalConditionId,0) ;;
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

  dimension: is_active {
    type: number
    hidden:yes
    sql: ${TABLE}.IsActive ;;
  }

  dimension: physical_condition {
    type: string
    sql: ${TABLE}.PhysicalCondition ;;

  }

  dimension: rank {
    type: number
    hidden:yes
    sql: ${TABLE}.Rank ;;
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
