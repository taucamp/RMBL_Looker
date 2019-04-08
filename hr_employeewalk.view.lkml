view: employee_walk {
  sql_table_name: hr_payroll.vw_employeewalk ;;



  dimension: current_salary {
    type: number
    hidden: yes
    sql: ${TABLE}.current_salary ;;
  }

   dimension: current_salary_is_exempt {
    type: string
    hidden: yes
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
    drill_fields: [full_name,start_date.date,departure_date.date,job_title,current_salary]
  }

  measure:  headcount_change{
    type: sum
    sql: ${TABLE}.employeecountchange ;;
  }

  measure: total_headcount {
    type: running_total
    sql: ${headcount_change} ;;
  }
}
