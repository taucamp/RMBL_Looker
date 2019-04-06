view: cls_listing {
  sql_table_name: public.rumble_clslisting ;;

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

  dimension: appraisalid {
    type: number
    value_format_name: id
    sql: ${TABLE}.appraisalid ;;
  }

  dimension: appraisalprice {
    type: number
    sql: ${TABLE}.appraisalprice ;;
  }

  dimension: categoryid {
    type: number
    value_format_name: id
    sql: ${TABLE}.categoryid ;;
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

  dimension: currentstep {
    type: number
    sql: ${TABLE}.currentstep ;;
  }

  dimension: ismileageunknown {
    type: number
    sql: ${TABLE}.ismileageunknown ;;
  }

  dimension: itemguid {
    type: string
    sql: ${TABLE}.itemguid ;;
  }

  dimension: itemtypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.itemtypeid ;;
  }

  dimension: listingid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listingid ;;
  }

  dimension: listingname {
    type: string
    sql: ${TABLE}.listingname ;;
  }

  dimension: listingrefno {
    type: string
    sql: ${TABLE}.listingrefno ;;
  }

  dimension: listingstatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listingstatusid ;;
  }

  dimension: listingyear {
    type: number
    sql: ${TABLE}.listingyear ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: mileage {
    type: number
    sql: ${TABLE}.mileage ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: nadamodelid {
    type: number
    value_format_name: id
    sql: ${TABLE}.nadamodelid ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: primarycolorid {
    type: number
    value_format_name: id
    sql: ${TABLE}.primarycolorid ;;
  }

  dimension: secondarycolorid {
    type: number
    value_format_name: id
    sql: ${TABLE}.secondarycolorid ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}.startdate ;;
  }

  dimension_group: stopdate {
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
    sql: ${TABLE}.stopdate ;;
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

  dimension: userid {
    type: number
    value_format_name: id
    sql: ${TABLE}.userid ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, listingname, __tablename, __schemaname]
  }
}
