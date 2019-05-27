view: rumble_invitem_bookdata_mileages {
  sql_table_name: public.rumble_invitem_bookdata_mileages ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: grade {
    type: number
    sql: ${TABLE}.grade ;;
  }

  dimension: mh1 {
    type: string
    sql: ${TABLE}.mh1 ;;
  }

  dimension: mh2 {
    type: string
    sql: ${TABLE}.mh2 ;;
  }

  dimension: mh3 {
    type: string
    sql: ${TABLE}.mh3 ;;
  }

  dimension: mh4 {
    type: string
    sql: ${TABLE}.mh4 ;;
  }

  dimension: mh5 {
    type: string
    sql: ${TABLE}.mh5 ;;
  }

  dimension: numunits {
    type: number
    sql: ${TABLE}.numunits ;;
  }

  dimension: rumble_invitem_bookdata_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.rumble_invitem_bookdata_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, rumble_invitem_bookdata.id]
  }
}
