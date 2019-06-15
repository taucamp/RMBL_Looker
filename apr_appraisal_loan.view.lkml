view: apr_appraisal_loan {
  sql_table_name: public.rumble_AprAppraisalLoan ;;

  dimension: appraisal_loan_id {
    primary_key:yes
    type: number
    hidden: yes
    sql: ${TABLE}.AppraisalLoanId ;;
  }

  dimension: account_number {
    type: string
    hidden: yes
    sql: ${TABLE}.AccountNumber ;;
  }

  dimension: appraisal_id {
    type: number
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: bank_name {
    type: string
    sql: ${TABLE}.BankName ;;
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

  dimension: loan_amount {
    type: number
    sql: ${TABLE}.LoanAmount ;;
  }

  dimension: loan_amount_bucket {
    type: tier
    tiers: [0,10000,20000,30000,40000,50000,75000,100000]
    style: relational
    sql: ${loan_amount} ;;
    value_format_name: usd_0
  }


  dimension: payment_amount {
    type: number
    sql: ${TABLE}.PaymentAmount ;;
  }

  dimension: payment_amount_bucket {
    type: tier
    tiers: [0,200,300,400,500,600,7500,10000]
    style: relational
    value_format_name: usd_0
    sql: ${payment_amount} ;;
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
    hidden: yes
    sql: ${TABLE}.PaymentNotes ;;
  }

  dimension: payment_type_id {
    type: number
    hidden: yes
    sql: ${TABLE}.PaymentTypeId ;;
  }

  dimension: payment_user_id {
    type: number
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.ReceiptConfirmedNotes ;;
  }

  dimension: receipt_confirmed_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ReceiptConfirmedUserId ;;
  }

  dimension: remaining_loan_amount {
    type: number
    sql: ${TABLE}.RemainingLoanAmount ;;
  }

  dimension: remaining_loan_amount_bucket {
  type: tier
  tiers: [0,2500,5000,7500,10000,15000,20000,25000,30000,40000,50000]
  style: relational
  value_format_name: usd_0
    sql: ${TABLE}.RemainingLoanAmount ;;
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
    drill_fields: [bank_name]
  }
}
