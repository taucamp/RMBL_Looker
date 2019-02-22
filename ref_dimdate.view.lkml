view: ref_dimdate {
  sql_table_name: public.ref_dimdate ;;

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension_group: datetime {
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
    sql: ${TABLE}.date_time ;;
  }

  dimension: datekey {
    type: number
    sql: ${TABLE}.datekey ;;
  }

  dimension: dayname {
    type: string
    sql: ${TABLE}.dayname ;;
  }

  dimension: dayofmonth {
    type: number
    sql: ${TABLE}.dayofmonth ;;
  }

  dimension: dayofquarter {
    type: number
    sql: ${TABLE}.dayofquarter ;;
  }

  dimension: dayofweekinmonth {
    type: number
    sql: ${TABLE}.dayofweekinmonth ;;
  }

  dimension: dayofweekinyear {
    type: number
    sql: ${TABLE}.dayofweekinyear ;;
  }

  dimension: dayofweekusa {
    type: number
    sql: ${TABLE}.dayofweekusa ;;
  }

  dimension: dayofyear {
    type: number
    sql: ${TABLE}.dayofyear ;;
  }

  dimension: daysuffix {
    type: string
    sql: ${TABLE}.daysuffix ;;
  }

  dimension_group: firstdayofmonth1 {
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
    sql: ${TABLE}.firstdayofmonth1 ;;
  }

  dimension_group: firstdayofquarter {
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
    sql: ${TABLE}.firstdayofquarter ;;
  }

  dimension_group: firstdayofweed {
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
    sql: ${TABLE}.firstdayofweed ;;
  }

  dimension_group: firstdayofyear {
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
    sql: ${TABLE}.firstdayofyear ;;
  }

  dimension_group: fulldateusa {
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
    sql: ${TABLE}.fulldateusa ;;
  }

  dimension: holidayusa {
    type: string
    sql: ${TABLE}.holidayusa ;;
  }

  dimension: isholiday {
    type: number
    sql: ${TABLE}.isholiday ;;
  }

  dimension: isholidayusa {
    type: number
    sql: ${TABLE}.isholidayusa ;;
  }

  dimension: isweekday {
    type: number
    sql: ${TABLE}.isweekday ;;
  }

  dimension_group: lastdayofmonth {
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
    sql: ${TABLE}.lastdayofmonth ;;
  }

  dimension_group: lastdayofquarter {
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
    sql: ${TABLE}.lastdayofquarter ;;
  }

  dimension_group: lastdayofyear {
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
    sql: ${TABLE}.lastdayofyear ;;
  }

  dimension: mmyyyy {
    type: string
    sql: ${TABLE}.mmyyyy ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: monthname {
    type: string
    sql: ${TABLE}.monthname ;;
  }

  dimension: monthofquarter {
    type: number
    sql: ${TABLE}.monthofquarter ;;
  }

  dimension: monthyear {
    type: string
    sql: ${TABLE}.monthyear ;;
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }

  dimension: quartername {
    type: string
    sql: ${TABLE}.quartername ;;
  }

  dimension: weekofmonth {
    type: number
    sql: ${TABLE}.weekofmonth ;;
  }

  dimension: weekofquarter {
    type: number
    sql: ${TABLE}.weekofquarter ;;
  }

  dimension: weekofyear {
    type: number
    sql: ${TABLE}.weekofyear ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: yearname {
    type: string
    sql: ${TABLE}.yearname ;;
  }

  measure: count {
    type: count
    drill_fields: [yearname, quartername, monthname, dayname]
  }
}
