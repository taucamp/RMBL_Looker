view: Payroll {
  sql_table_name: hr_payroll.vw_payroll_combined ;;

  dimension: additional_wages {
    type: number
    sql: ${TABLE}."additional wages" ;;
  }

  dimension: branch_name {
    type: string
    sql: ${TABLE}."branch name" ;;
  }

  dimension: commissions {
    type: number
    sql: ${TABLE}.commissions ;;
  }

  dimension_group: date_paid {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date paid" ;;
  }

  dimension: department_name {
    type: string
    sql: ${TABLE}."department name" ;;
  }

  dimension: division_name {
    type: string
    sql: ${TABLE}."division name" ;;
  }

  dimension: employee {
    type: string
    sql: ${TABLE}.employee ;;
  }

  dimension: overtime_pay {
    type: number
    sql: ${TABLE}."overtime pay" ;;
  }

  dimension: regular_pay {
    type: number
    sql: ${TABLE}."regular pay" ;;
  }

  dimension: total_gross_wages {
    type: number
    sql: ${TABLE}."total gross wages" ;;
  }

  measure: count {
    type: count
    drill_fields: [division_name, branch_name, department_name]
  }
}
