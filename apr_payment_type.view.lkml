view: apr_payment_type {
  sql_table_name: public.rumble_AprPaymentType ;;

  dimension: payment_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.PaymentTypeId ;;
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

  dimension: payment_type {
    type: string
    sql: ${TABLE}.PaymentType ;;
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
