view: cls_listing {
  sql_table_name: public.rumble_clslisting ;;

 set:classified_listing_drillthru {
    fields: [appraisalprice]
    }



# IDs AND JOIN IDENTIFIERS

  dimension: listingid {
    primary_key: yes
    label: "Listing ID"
    view_label: "Classified Detail"
    type: number
    value_format_name: id
    sql: ${TABLE}.listingid ;;
  }

  dimension: appraisalid {
    label: "Appraisal ID"
    view_label: "Classified Detail"
    type: number
    value_format_name: id
    sql: ${TABLE}.appraisalid ;;
  }

  dimension: categoryid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.categoryid ;;
  }

  dimension: currentstep {
    hidden:yes
    type: number
    sql: ${TABLE}.currentstep ;;
  }

  dimension: itemtypeid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.itemtypeid ;;
  }

  dimension: listingstatusid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.listingstatusid ;;
  }

  dimension: nadamodelid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.nadamodelid ;;
  }

  dimension: primarycolorid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.primarycolorid ;;
  }

  dimension: secondarycolorid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.secondarycolorid ;;
  }

  dimension: updateduserid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.updateduserid ;;
  }

  dimension: userid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.userid ;;
  }



# DATE INFORMATION

  dimension_group: createddate {
    label: "Created Date"
    view_label: "Classified Detail"
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

  dimension_group: startdate {
    type: time
    timeframes: [
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
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updateddate ;;
  }





# LISTING INFORMATION

  dimension: appraisalprice {
    label: "Appraisal Price"
    view_label: "Classified Detail"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.appraisalprice ;;
  }


  dimension: ismileageunknown {
    label: "Is Mileage Unknown"
    view_label: "Classified Detail"
    type: yesno
    sql: ${TABLE}.ismileageunknown = 1 ;;
  }

  dimension: itemguid {
    hidden:yes
    type: string
    sql: ${TABLE}.itemguid ;;
  }

  dimension: listingname {
    label: "Listing Name"
    view_label: "Classified Detail"
    type: string
    sql: ${TABLE}.listingname ;;
  }

  dimension: listingrefno {
    hidden:yes
    type: string
    sql: ${TABLE}.listingrefno ;;
  }

  dimension: listingyear {
    label: "Model Year"
    view_label: "Classified Detail"
    type: number
    sql: ${TABLE}.listingyear ;;
  }

  dimension: make {
    view_label: "Classified Detail"
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: mileage {
    view_label: "Classified Detail"
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.mileage ;;
  }

  dimension: model {
    view_label: "Classified Detail"
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: price {
    hidden:yes
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.price ;;
  }

   dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

#   dimension: id {
#     hidden:yes
#     type: string
#     sql: ${TABLE}.id ;;
#   }
#
#   dimension: __schemaname {
#     hidden:yes
#     type: string
#     sql: ${TABLE}.__schemaname ;;
#   }
#
#   dimension_group: __senttime {
#     hidden:yes
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.__senttime ;;
#   }
#
#   dimension: __tablename {
#     hidden:yes
#     type: string
#     sql: ${TABLE}.__tablename ;;
#   }
#
#   dimension_group: __updatetime {
#     hidden:yes
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.__updatetime ;;
#   }

  measure: count {
    type: count
   drill_fields: [classified_listing_drillthru*]
  }
}
