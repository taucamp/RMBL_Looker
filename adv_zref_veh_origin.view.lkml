view: adv_zref_veh_origin {
  sql_table_name: public.adv_zref_veh_origin ;;

  dimension: account {
    hidden:yes
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: inventory_origin {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: advent_dealership {
    description: "The Advent dealership - in June 2019 we consolidated the Wholesale and AutoSport inventory into the Wholesale dealership"
    group_label: "Dealership Info"
    type: string
    sql: nvl(f_sql_adv_dealername(${TABLE}.dealer),'UNKNOWN') ;;
  }

  dimension: Is_active_advent_dealership {
    description: "Used to eliminate the old AutoSport data that was from the initial use of Advent - in June 2019 we consolidated the Wholesale and AutoSport inventory into the Wholesale dealership"
    group_label: "Dealership Info"
    type: yesno
    sql: case when nvl(f_sql_adv_dealername(${TABLE}.dealer),'UNKNOWN') in ('Wholesale','RumbleOn') then 1 else 0 end ;;
  }

  dimension: dealer {
    hidden:yes
    type: string
    sql: ${TABLE}.dealer ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: isactive {
    hidden:yes
    type: string
    sql: ${TABLE}.isactive ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
