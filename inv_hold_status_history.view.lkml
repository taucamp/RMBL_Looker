view: inv_hold_status_history {
  sql_table_name: public.rumble_InvHoldStatusHistory ;;


  dimension: hold_status_history_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.HoldStatusHistoryId ;;
  }

  dimension: advent_opportunity_guid {
    type: string
    sql: ${TABLE}.AdventOpportunityGuid ;;
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

  dimension_group: hold {
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
    sql: ${TABLE}.HoldDate ;;
  }

  dimension_group: hold_expiry {
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
    sql: ${TABLE}.HoldExpiryDate ;;
  }


  dimension: hold_user_id {
    type: number
    sql: ${TABLE}.HoldUserID ;;
  }

  dimension: holdtype {
    type: number
    sql: ${TABLE}.Holdtype ;;
  }

  dimension: is_active {
    type: string
    hidden: yes
    sql: ${TABLE}.IsActive ;;
  }


  dimension: is_properly_refunded {
    type: yesno
    sql: ${TABLE}.isproperlyrefunded ;;
  }


  dimension: item_id {
    type: number
    sql: ${TABLE}.ItemId ;;
  }

  dimension: payment_type_id {
    type: number
    hidden: yes
    sql: ${TABLE}.PaymentTypeId ;;
  }

  dimension: paid_hold {
    type: yesno
    sql: ${TABLE}.paidhold ;;
  }

  dimension_group: released {
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
    sql: ${TABLE}.ReleasedDate ;;
  }

  dimension: released_user_id {
    type: number
    sql: ${TABLE}.ReleasedUserId ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: transaction_no {
    type: string
    sql: ${TABLE}.TransactionNo ;;
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
    drill_fields: []
  }
}
