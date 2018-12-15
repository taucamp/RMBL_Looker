view: inv_crtype {
  sql_table_name: public.rumble_InvCRType ;;

  dimension: authority_name {
    type: string
    sql: ${TABLE}.AuthorityName ;;
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

  dimension: crtype {
    type: string
    sql: ${TABLE}.CRType ;;
    order_by_field: rank
  }

  dimension: crtype_id {
    type: number
    sql: ${TABLE}.CRTypeId ;;
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

  measure: count {
    type: count
    drill_fields: [authority_name]
  }
}
