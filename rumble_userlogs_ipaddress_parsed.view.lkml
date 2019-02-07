view: rumble_userlogs_ipaddress_parsed {
  sql_table_name: public.rumble_userlogs_ipaddress_parsed ;;

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

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: rumble_userlogs_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.rumble_userlogs_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      rumble_userlogs.f2name,
      rumble_userlogs.f1name,
      rumble_userlogs.__tablename,
      rumble_userlogs.__schemaname,
      rumble_userlogs.id
    ]
  }
}
