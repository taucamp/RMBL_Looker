view: inv_npatype {
  sql_table_name: public.rumble_InvNPAType ;;

  dimension: npatype_id {
    primary_key: yes
    type: number
    hidden:yes
    sql: ${TABLE}.NPATypeId ;;
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
    type: string
    hidden:yes
    sql: ${TABLE}.IsActive ;;
  }

  dimension: npatype {
    type: string
    sql: ${TABLE}.NPAType ;;
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
