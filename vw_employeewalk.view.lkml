view: vw_employeewalk {
  sql_table_name: hr_payroll.vw_employeewalk ;;

  dimension: company_email {
    type: string
    hidden: yes
    sql: ${TABLE}.company_email ;;
  }

  dimension: current_pay_group {
    type: string
    hidden: yes
    sql: ${TABLE}.current_pay_group ;;
  }

  dimension: current_salary {
    type: number
    hidden: yes
    sql: ${TABLE}.current_salary ;;
  }

  dimension: current_salary_amount {
    type: number
    hidden: yes
    sql: ${TABLE}.current_salary_amount ;;
  }

  dimension: current_salary_frequency {
    type: string
    hidden: yes
    sql: ${TABLE}.current_salary_frequency ;;
  }

  dimension: current_salary_is_exempt {
    type: string
    hidden: yes
    sql: ${TABLE}.current_salary_is_exempt ;;
  }

  dimension_group: date_of_birth {
    type: time
    hidden: yes
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
    sql: ${TABLE}.date_of_birth ;;
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

  dimension: departments {
    type: string
    sql: ${TABLE}.departments ;;
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

  dimension: employee_number {
    hidden: yes
    type: number
    sql: ${TABLE}.employee_number ;;
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

  dimension: ethnicity {
    hidden: yes
    type: string
    sql: ${TABLE}.ethnicity ;;
  }

  dimension: full_name {
    hidden: yes
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: gender {
    hidden: yes
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: home_address_1 {
    hidden: yes
    type: string
    sql: ${TABLE}.home_address_1 ;;
  }

  dimension: home_address_2 {
    hidden: yes
    type: string
    sql: ${TABLE}.home_address_2 ;;
  }

  dimension: home_city {
    hidden: yes
    type: string
    sql: ${TABLE}.home_city ;;
  }

  dimension: home_state {
    hidden: yes
    type: string
    sql: ${TABLE}.home_state ;;
  }

  dimension: home_zip {
    hidden: yes
    type: string
    sql: ${TABLE}.home_zip ;;
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

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_sign_in {
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
    sql: ${TABLE}.last_sign_in_at ;;
  }

  dimension: legal_first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.legal_first_name ;;
  }

  dimension: marital_status {
    hidden: yes
    type: string
    sql: ${TABLE}.marital_status ;;
  }

  dimension: namely_guid {
    hidden: yes
    type: string
    sql: ${TABLE}.namely_guid ;;
  }

  dimension: office_location {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: office_location_address_1 {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location_address_1 ;;
  }

  dimension: office_location_address_2 {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location_address_2 ;;
  }

  dimension: office_location_city {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location_city ;;
  }

  dimension: office_location_state_id {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location_state_id ;;
  }

  dimension: office_location_zip {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location_zip ;;
  }

  dimension: preferred_name {
    hidden: yes
    type: string
    sql: ${TABLE}.preferred_name ;;
  }

  dimension: reports_to_full_name {
    hidden: yes
    type: string
    sql: ${TABLE}.reports_to_full_name ;;
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
    drill_fields: [reports_to_full_name, preferred_name, full_name, last_name, legal_first_name]
  }

  measure:  headcount_change{
    type: sum
    sql: ${TABLE}.employeecountchange ;;
  }
}
