view: cls_listingstatus {
  sql_table_name: public.rumble_clslistingstatus ;;

# Make sure to us ISACTIVE in teh SQL_ALWAYS_WHERE of any EXPLORE


  dimension: listingstatusid {
    primary_key: yes
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.listingstatusid ;;
  }

  dimension: listingstatus {
    type: string
    label: "Listing Status"
    view_label: "Classified Summary Info"
    order_by_field: rank
    sql: ${TABLE}.listingstatus ;;
  }

  dimension: listingdescription {
    hidden:yes
    type: string
    sql: ${TABLE}.listingdescription ;;
  }

  dimension: isactive {
    hidden:yes
    type: number
    sql: ${TABLE}.isactive = 1 ;;
  }

  dimension: rank {
    hidden:yes
    type: number
    sql: ${TABLE}.rank ;;
  }

  measure: count {
    hidden:yes
    type: count
    drill_fields: [listingstatus, listingdescription]
  }



# BALANCE OF FIELDS ARE NOT USED

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



  dimension_group: updateddate {
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
    sql: ${TABLE}.updateddate ;;
  }

  dimension: updateduserid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.updateduserid ;;
  }


}
