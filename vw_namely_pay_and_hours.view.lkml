view: vw_namely_pay_and_hours {
  sql_table_name: hr_payroll.vw_namely_pay_and_hours ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: branch_name {
    type: string
    sql: ${TABLE}."branch name" ;;
  }

  dimension: class_name {
    type: string
    sql: ${TABLE}."class name" ;;
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

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.employeeid ;;
  }

  dimension: metric {
    type: string
    sql: ${TABLE}.metric ;;
  }

  dimension: metric_type {
    type: string
    sql: ${TABLE}."metric type" ;;
  }

  dimension_group: payroll_week {
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
    sql: ${TABLE}."payroll week" ;;
  }

  dimension_group: week_paid {
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
    sql: ${TABLE}."week paid" ;;
  }

  measure: count {
    type: count
    drill_fields: [division_name, branch_name, class_name, department_name]
  }

  measure: amount_total {
    type: sum
    sql: ${TABLE}.amount ;;
  }
}
