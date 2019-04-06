view: cls_color {
  sql_table_name: public.rumble_clscolor ;;

# Make sure to us ISACTIVE in teh SQL_ALWAYS_WHERE of any EXPLORE

  dimension: id {
    hidden:yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: __schemaname {
    hidden:yes
    type: string
    sql: ${TABLE}.__schemaname ;;
  }

  dimension_group: __senttime {
    hidden:yes
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
    hidden:yes
    type: string
    sql: ${TABLE}.__tablename ;;
  }

  dimension_group: __updatetime {
    hidden:yes
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

  dimension: colorid {
    primary_key: yes
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.colorid ;;
  }

  dimension: colorname {
    type: string
    sql: ${TABLE}.colorname ;;
  }

  dimension_group: createddate {
    hidden:yes
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
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.createduserid ;;
  }

  dimension: isactive {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  measure: count {
    hidden:yes
    type: count
    drill_fields: [id, colorname, __tablename, __schemaname]
  }
}
