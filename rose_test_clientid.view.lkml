view: rose_test_clientid {
  sql_table_name: public.rose_test_clientid ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: __sampled {
    type: number
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: avgtimeonpage {
    type: number
    sql: ${TABLE}.avgtimeonpage ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: dimension1 {
    type: number
    sql: ${TABLE}.dimension1 ;;
  }

  dimension: dimension2 {
    type: string
    sql: ${TABLE}.dimension2 ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: timeonpage {
    type: number
    sql: ${TABLE}.timeonpage ;;
  }

  dimension: uniquepageviews {
    type: number
    sql: ${TABLE}.uniquepageviews ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
