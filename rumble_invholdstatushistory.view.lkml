view: rumble_invholdstatushistory {
  sql_table_name: public.rumble_invholdstatushistory ;;

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

  dimension: adventopportunityguid {
    type: string
    sql: ${TABLE}.adventopportunityguid ;;
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

  dimension_group: holddate {
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
    sql: ${TABLE}.holddate ;;
  }

  dimension_group: holdexpirydate {
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
    sql: ${TABLE}.holdexpirydate ;;
  }

  dimension: holdstatushistoryid {
    type: number
    value_format_name: id
    sql: ${TABLE}.holdstatushistoryid ;;
  }

  dimension: holdtype {
    type: number
    sql: ${TABLE}.holdtype ;;
  }

  dimension: holduserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.holduserid ;;
  }

  dimension: isactive {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: itemid {
    type: number
    value_format_name: id
    sql: ${TABLE}.itemid ;;
  }

  dimension_group: releaseddate {
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
    sql: ${TABLE}.releaseddate ;;
  }

  dimension: releaseduserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.releaseduserid ;;
  }

  dimension: transactionno {
    type: string
    sql: ${TABLE}.transactionno ;;
  }

  dimension_group: updateddate {
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
    sql: ${TABLE}.updateddate ;;
  }

  dimension: updateduserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.updateduserid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, __tablename, __schemaname]
  }
}
