view: apr_mechanical_condition {
  sql_table_name: public.rumble_AprMechanicalCondition ;;

  dimension: mechanical_condition_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.MechanicalConditionId ;;
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

  dimension: mechanical_condition {
    type: string
    sql: ${TABLE}.MechanicalCondition ;;
    order_by_field: rank
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
