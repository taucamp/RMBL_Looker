view: inv_item_bookdata_times {
  sql_table_name: public.rumble_invitem_bookdata_times ;;

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
    type: time
    hidden: yes
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
    hidden: yes
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

  dimension: max_mile_shours {
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

  dimension: sale_month {
    type: number
    sql: ${TABLE}.salemonth ;;
  }

  dimension: sale_year {
    type: number
    sql: ${TABLE}.saleyear ;;
  }

  measure: count {
    type: count
    drill_fields: [id, rumble_invitem_bookdata.id]
  }
}
