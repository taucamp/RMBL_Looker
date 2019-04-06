view: apr_appraisal_status {
  sql_table_name: public.rumble_AprAppraisalStatus ;;

  dimension: appraisal_status {
    type: string
    sql: cast(appraisal_status_id as varchar)+' - '${TABLE}.AppraisalStatus ;;
    order_by_field: rank
  }

  dimension: appraisal_status_id {
    hidden:yes
    primary_key: yes
    type: number
    sql: ${TABLE}.AppraisalStatusId ;;
  }

  dimension_group: created {
    hidden:yes
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
    hidden:yes
    type: number
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: is_active {
    hidden:yes
    type: number
    sql: ${TABLE}.IsActive ;;
  }

  dimension: rank {
    hidden:yes
    type: number
    sql: ${TABLE}.Rank ;;
  }

  dimension_group: updated {
    hidden:yes
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
    hidden:yes
    type: number
    sql: ${TABLE}.UpdatedUserId ;;
  }

  measure: count {
    hidden:yes
    type: count
    drill_fields: []
  }
}
