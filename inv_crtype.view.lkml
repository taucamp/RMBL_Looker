view: inv_crtype {
  sql_table_name: public.rumble_InvCRType ;;

  dimension: crtype_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.CRTypeId ;;
  }

  dimension: authority_name {
    type: string
    sql: ${TABLE}.AuthorityName ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension: created_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: crtype {
    type: string
    sql: ${TABLE}.CRType ;;
    order_by_field: rank
  }



  dimension: is_active {
    type: number
    hidden: yes
    sql: ${TABLE}.IsActive ;;
  }

  dimension: rank {
    type: number
    hidden: yes
    sql: ${TABLE}.Rank ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.UpdatedDate ;;
  }

  dimension: updated_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.UpdatedUserId ;;
  }

  measure: count {
    type: count
    drill_fields: [authority_name]
  }
}
