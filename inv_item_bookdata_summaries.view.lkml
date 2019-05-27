view: inv_item_bookdata_summaries {
  sql_table_name: public.rumble_invitem_bookdata_summaries ;;

  dimension: id {
    primary_key: yes
    type: string
    hidden:yes
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
    type: time
    hidden:yes
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
    hidden:yes
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

  dimension: avg_miles_hours {
    type: number
    sql: ${TABLE}.avgmileshours ;;
  }

  dimension: avg_sale {
    type: number
    sql: ${TABLE}.avgsale ;;
  }

  dimension: avg_score {
    type: number
    sql: ${TABLE}.avgscore ;;
  }

  dimension: max_miles_hours {
    type: number
    sql: ${TABLE}.maxmileshours ;;
  }

  dimension: max_sale {
    type: number
    sql: ${TABLE}.maxsale ;;
  }

  dimension: max_score {
    type: number
    sql: ${TABLE}.maxscore ;;
  }

  dimension: min_miles_hours {
    type: number
    sql: ${TABLE}.minmileshours ;;
  }

  dimension: min_sale {
    type: number
    sql: ${TABLE}.minsale ;;
  }

  dimension: min_score {
    type: number
    sql: ${TABLE}.minscore ;;
  }

  dimension: num_units {
    type: number
    sql: ${TABLE}.numunits ;;
  }

  dimension: rumble_invitem_bookdata_id {
    type: string
    hidden: yes
    sql: ${TABLE}.rumble_invitem_bookdata_id ;;
  }

  dimension: vehicle_brand {
    type: string
    sql: ${TABLE}.vehiclebrand ;;
  }

  dimension: vehicle_model {
    type: string
    sql: ${TABLE}.vehiclemodel ;;
  }

  measure: count {
    type: count
    drill_fields: [id, rumble_invitem_bookdata.id]
  }
}
