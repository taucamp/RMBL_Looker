view: Payroll {

  sql_table_name: hr_payroll.vw_payroll_combined ;;

  dimension: additional_wages {
    type: number
    sql: ${TABLE}."additional wages" ;;
  }

  dimension: bonus {
    type: number
    sql: ${TABLE}."bonus" ;;
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

  dimension: Has_OT_Pay {
    type: yesno
    sql:  ${overtime_pay} > 0 ;;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee,total_OT]
  }

  dimension: regular_pay {
    type: number
    sql: ${TABLE}."regular pay" ;;
  }

  dimension: rsu_pay {
    type: number
    sql: ${TABLE}."rsu pay" ;;
  }

  dimension: total_gross_wages {
    type: number
    sql: ${TABLE}."total gross wages" ;;
  }

  dimension: normal_wages {
    type: number
    sql: ${TABLE}."normal wages" ;;
  }



  measure: count {
    type: count
    drill_fields: [division_name, branch_name, department_name]
  }

  measure: total_regular_pay {
    type: sum
    sql: ${regular_pay} ;;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee]
  }

  measure: total_additional_wages {
    type: sum
    sql: ${additional_wages} ;;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee]
  }

  measure: total_bonus {
    type: sum
    sql: ${bonus} ;;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee]
  }


  measure: total_commissions {
    type: sum
    sql: ${commissions} ;;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee]
  }

  measure: total_RSU {
    type: sum
    sql: ${rsu_pay} ;;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee]
  }

  measure: total_OT {
    type: sum
    sql: ${overtime_pay} ;;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee,total_OT]
  }




  measure: total_normal_wages {
    type: sum
    sql: ${normal_wages} ;;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee,total_payroll]
  }
    measure: total_payroll {
    type: sum
    sql: ${total_gross_wages};;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee,total_payroll]
  }

  measure: total_payroll_and_bonus_ex_RSU {
    type: sum
    sql: ${total_gross_wages} - ${rsu_pay};;
    value_format_name: usd
    drill_fields: [branch_name,department_name,employee,total_payroll]
  }

  measure: Employees_Paid{
    type: count_distinct
    sql: ${employee} ;;
    drill_fields: [branch_name,department_name,employee]
  }

  measure: Employees_Paid_OT{
    type: sum
    sql: case when ${overtime_pay} > 0 then 1 else 0 end ;;
    drill_fields: [branch_name,department_name,employee,total_OT]
  }

}
