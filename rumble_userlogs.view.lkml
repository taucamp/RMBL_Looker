view: rumble_userlogs {
  sql_table_name: public.rumble_userlogs ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: __schemaname {
    type: string
    sql: ${TABLE}.__schemaname ;;
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

  dimension: __tablename {
    type: string
    sql: ${TABLE}.__tablename ;;
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

  dimension: appid {
    type: number
    value_format_name: id
    sql: ${TABLE}.appid ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}.createddate ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: f1name {
    type: string
    sql: ${TABLE}.f1name ;;
  }

  dimension: f1value {
    type: string
    sql: ${TABLE}.f1value ;;
  }

  dimension: f2name {
    type: string
    sql: ${TABLE}.f2name ;;
  }

  dimension: f2value {
    type: string
    sql: ${TABLE}.f2value ;;
  }

  dimension: gaclientid {
    type: string
    sql: ${TABLE}.gaclientid ;;
  }

  dimension: gasessionid {
    type: string
    sql: ${TABLE}.gasessionid ;;
  }

  dimension: ipaddress {
    type: string
    sql: ${TABLE}.ipaddress ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: pageviewid {
    type: string
    sql: ${TABLE}.pageviewid ;;
  }

  dimension: refererurl {
    type: string
    sql: ${TABLE}.refererurl ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: useruuid {
    type: string
    sql: ${TABLE}.useruuid ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      f2name,
      f1name,
      __tablename,
      __schemaname,
      rumble_userlogs_ipaddress_parsed.count
    ]
  }
}
