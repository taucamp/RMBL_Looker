view: rumble_invgenerictype {
  sql_table_name: public.rumble_invgenerictype ;;

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

  dimension: generictype {
    type: string
    sql: ${TABLE}.generictype ;;
  }

  dimension: generictypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.generictypeid ;;
  }

  dimension: isactive {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  measure: count {
    type: count
    drill_fields: [id, __tablename, __schemaname]
  }
}
