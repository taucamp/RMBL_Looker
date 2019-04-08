view: employee_walk {
  sql_table_name: hr_payroll.vw_employeewalk ;;

  set: Employee_Drillthrough {
    fields: [full_name,start_date.date,departure_date.date,job_title,current_salary]
  }

  dimension: current_salary {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.current_salary ;;
  }

   dimension: current_salary_is_exempt {
    hidden: yes
    type: string
    sql: ${TABLE}.current_salary_is_exempt ;;
  }


  dimension_group: datechange {
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
    sql: ${TABLE}.datechange ;;
  }


  dimension_group: departure {
    hidden: yes
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
    sql: ${TABLE}.departure_date ;;
  }

 dimension: employee_type {
    hidden: yes
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: employeecountchange {
    type: number
    sql: ${TABLE}.employeecountchange ;;
  }


  dimension: full_name {
    hidden: yes
    type: string
    sql: ${TABLE}.full_name ;;
  }


  dimension: job_tier {
    hidden: yes
    type: string
    sql: ${TABLE}.job_tier ;;
  }

  dimension: job_title {
    hidden: yes
    type: string
    sql: ${TABLE}.job_title ;;
  }


  dimension: office_location {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location ;;
  }


  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: statuschange {
    type: string
    sql: ${TABLE}.statuschange ;;
  }

  dimension: terminated_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.terminated_reason ;;
  }

  dimension: user_status {
    hidden: yes
    type: string
    sql: ${TABLE}.user_status ;;
  }

  measure: count {
    type: count
    drill_fields: [Employee_Drillthrough*]
  }

  measure:  headcount_change{
    type: sum
    sql: ${employeecountchange} ;;
    drill_fields: [Employee_Drillthrough*]
  }

  measure:  hires{
    type: sum
        sql:  ${employeecountchange};;
    filters:{
      field: statuschange
      value: "Hire"
      }
    drill_fields: [Employee_Drillthrough*]
  }

  measure:  departures{
    type: sum
    sql:  ${employeecountchange} ;;
    filters:{
      field: statuschange
      value: "Termination"
      }
    drill_fields: [Employee_Drillthrough*]
  }

  measure: total_headcount {
    type: running_total
    sql: ${headcount_change} ;;
    drill_fields: [Employee_Drillthrough*]
  }

  measure:  pay_change{
    type: sum
    sql: ${current_salary};;
    drill_fields: [Employee_Drillthrough*]
  }

  measure:  hires_pay{
    type: sum
    value_format_name: usd_0
    sql:  ${current_salary};;
    filters:{
      field: statuschange
      value: "Hire"
    }
    drill_fields: [Employee_Drillthrough*]
  }

  measure:  departures_pay{
    type: sum
    value_format_name: usd_0
    sql:  ${current_salary} ;;
    filters:{
      field: statuschange
      value: "Termination"
    }
    drill_fields: [Employee_Drillthrough*]
  }

  measure: total_pay {
    type: running_total
    value_format_name: usd_0
    sql: ${pay_change} ;;
    drill_fields: [Employee_Drillthrough*]
  }

}
