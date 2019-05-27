view: inv_item_bookdata_summaries {
  sql_table_name: public.rumble_invitem_bookdata_summaries ;;

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

  dimension: avgmileshours {
    type: number
    sql: ${TABLE}.avgmileshours ;;
  }

  dimension: avgsale {
    type: number
    sql: ${TABLE}.avgsale ;;
  }

  dimension: avgscore {
    type: number
    sql: ${TABLE}.avgscore ;;
  }

  dimension: maxmileshours {
    type: number
    sql: ${TABLE}.maxmileshours ;;
  }

  dimension: maxsale {
    type: number
    sql: ${TABLE}.maxsale ;;
  }

  dimension: maxscore {
    type: number
    sql: ${TABLE}.maxscore ;;
  }

  dimension: minmileshours {
    type: number
    sql: ${TABLE}.minmileshours ;;
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

  dimension: vehiclebrand {
    type: string
    sql: ${TABLE}.vehiclebrand ;;
  }

  dimension: vehiclemodel {
    type: string
    sql: ${TABLE}.vehiclemodel ;;
  }

  measure: count {
    type: count
    drill_fields: [id, rumble_invitem_bookdata.id]
  }
}
