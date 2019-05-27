view: rumble_invitem_bookdata_conditions {
  sql_table_name: public.rumble_invitem_bookdata_conditions ;;

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

  dimension: avgsale {
    type: number
    sql: ${TABLE}.avgsale ;;
  }

  dimension: avgscore {
    type: number
    sql: ${TABLE}.avgscore ;;
  }

  dimension: grade {
    type: number
    sql: ${TABLE}.grade ;;
  }

  dimension: maxsale {
    type: number
    sql: ${TABLE}.maxsale ;;
  }

  dimension: maxscore {
    type: number
    sql: ${TABLE}.maxscore ;;
  }

  dimension: minsale {
    type: number
    sql: ${TABLE}.minsale ;;
  }

  dimension: minscore {
    type: number
    sql: ${TABLE}.minscore ;;
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
