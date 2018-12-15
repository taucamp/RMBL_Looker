view: rumble_orgrole {
  sql_table_name: public.rumble_orgrole ;;

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

  dimension: roleid {
    type: number
    value_format_name: id
    sql: ${TABLE}.roleid ;;
  }

  dimension: rolename {
    type: string
    sql: ${TABLE}.rolename ;;
  }

  measure: count {
    type: count
    drill_fields: [id, rolename, __tablename, __schemaname]
  }
}
