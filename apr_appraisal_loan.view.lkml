view: apr_appraisal_loan {
  sql_table_name: public.rumble_AprAppraisalLoan ;;

  dimension: account_number {
    type: string
    sql: ${TABLE}.AccountNumber ;;
  }

  dimension: appraisal_id {
    type: number
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: appraisal_loan_id {
    primary_key:yes
    type: number
    sql: ${TABLE}.AppraisalLoanId ;;
  }

  dimension: bank_name {
    type: string
    sql: ${TABLE}.BankName ;;
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

  dimension: loan_amount {
    type: number
    sql: ${TABLE}.LoanAmount ;;
  }

  dimension: payment_amount {
    type: number
    sql: ${TABLE}.PaymentAmount ;;
  }

  dimension_group: payment {
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
    sql: ${TABLE}.PaymentDate ;;
  }

  dimension: payment_notes {
    type: string
    sql: ${TABLE}.PaymentNotes ;;
  }

  dimension: payment_type_id {
    type: number
    sql: ${TABLE}.PaymentTypeId ;;
  }

  dimension: payment_user_id {
    type: number
    sql: ${TABLE}.PaymentUserId ;;
  }

  dimension_group: receipt_confirmed {
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
    sql: ${TABLE}.ReceiptConfirmedDate ;;
  }

  dimension: receipt_confirmed_notes {
    type: string
    sql: ${TABLE}.ReceiptConfirmedNotes ;;
  }

  dimension: receipt_confirmed_user_id {
    type: number
    sql: ${TABLE}.ReceiptConfirmedUserId ;;
  }

  dimension: remaining_loan_amount {
    type: number
    sql: ${TABLE}.RemainingLoanAmount ;;
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
    drill_fields: [bank_name]
  }
}
