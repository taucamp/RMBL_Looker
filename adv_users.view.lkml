view: adv_users {
  sql_table_name: public.adv_users ;;

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: dealer_id {
    type: string
    hidden: yes
    sql: ${TABLE}.dealer_id ;;
  }

  dimension: employee_number {
    type: number
    hidden: yes
    sql: ${TABLE}.employee_number ;;
  }

  dimension: first_name {
    type: string
    hidden: yes
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    hidden: yes
    sql: ${TABLE}.last_name ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.last_name +', '+${TABLE}.first_name;;
  }


  dimension: user {
    type: number
    sql: ${TABLE}."user" ;;
  }

  dimension: user_account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.user_account_id ;;
  }

  dimension: username {
    type: string
    hidden: yes
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [id, username, first_name, last_name]
  }
}
