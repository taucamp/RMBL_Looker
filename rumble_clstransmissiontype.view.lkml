view: rumble_clstransmissiontype {
  sql_table_name: public.rumble_clstransmissiontype ;;

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

  dimension: createduserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.createduserid ;;
  }

  dimension: isactive {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: transmissiontypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.transmissiontypeid ;;
  }

  dimension: transmissiontypename {
    type: string
    sql: ${TABLE}.transmissiontypename ;;
  }

  measure: count {
    type: count
    drill_fields: [id, transmissiontypename, __tablename, __schemaname]
  }
}
