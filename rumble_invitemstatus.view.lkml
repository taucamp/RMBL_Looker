view: rumble_invitemstatus {
  sql_table_name: public.rumble_invitemstatus ;;

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

  dimension: isactive {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: itemstatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}.itemstatusid ;;
  }

  dimension: listingstatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listingstatusid ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: statusname {
    type: string
    sql: ${TABLE}.statusname ;;
  }

  measure: count {
    type: count
    drill_fields: [id, statusname, __tablename, __schemaname]
  }
}
