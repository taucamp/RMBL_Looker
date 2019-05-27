view: inv_payment_type {
  sql_table_name: public.rumble_InvPaymentType ;;

  dimension: payment_type_id {
    primary_key: yes
    type: number
    hidden:yes
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

  dimension: payment_type_name {
    type: string
    sql: ${TABLE}.PaymentTypeName ;;
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
    drill_fields: [payment_type_name]
  }
}
