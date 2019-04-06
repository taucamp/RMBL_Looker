view: rumble_clslistinghistory {
  sql_table_name: public.rumble_clslistinghistory ;;

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

  dimension: historyid {
    type: number
    value_format_name: id
    sql: ${TABLE}.historyid ;;
  }

  dimension: listingid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listingid ;;
  }

  dimension: listingstatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listingstatusid ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}.startdate ;;
  }

  dimension_group: stopdate {
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
    sql: ${TABLE}.stopdate ;;
  }

  measure: count {
    type: count
    drill_fields: [id, __tablename, __schemaname]
  }
}
