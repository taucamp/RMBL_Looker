view: apr_listing_type {
  sql_table_name: public.rumble_AprListingType ;;

  dimension: listing_type_id {
    primary_key: yes
    hidden:yes
    type: number
    sql: ${TABLE}.ListingTypeId ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension: created_user_id {
    hidden:yes
    type: number
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: is_active {
    hidden:yes
    type: number
    sql: ${TABLE}.IsActive ;;
  }

  dimension: listing_type {
    type: string
    sql: ${TABLE}.ListingType ;;
    order_by_field: rank
  }



  dimension: rank {
    hidden:yes
    type: number
    sql: ${TABLE}.Rank ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.UpdatedDate ;;
  }

  dimension: updated_user_id {
    hidden:yes
    type: number
    sql: ${TABLE}.UpdatedUserId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
