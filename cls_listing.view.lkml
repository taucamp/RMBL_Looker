view: cls_listing {
  sql_table_name: public.rumble_clslisting ;;

 set:classified_listing_drillthru {
    fields: [listingid, listingname, make, model, listingyear, mileage, price, vin]
    }



# IDs AND JOIN IDENTIFIERS

  dimension: listingid {
    primary_key: yes
    label: "Listing ID"
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.listingid ;;
  }

  dimension: appraisalid {
    hidden:yes
    label: "Appraisal ID"
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
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.startdate ;;
  }

  dimension_group: days_listed {
    type: duration
    intervals: [day]
    sql_start: ${startdate.raw} ;;
    sql_end: GETDATE();;
  }

  dimension: days_listed_bucket {
    type: tier
    style: integer
    tiers: [0,15,30,45,60]
    value_format_name: decimal_0
    sql: ${days_days_listed} ;;
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

  dimension_group: days_remaining {
    type: duration
    intervals: [day]
    sql_start:  GETDATE() ;;
    sql_end: ${stopdate.raw};;
  }

  dimension: days_remaining_bucket {
    type: tier
    style: integer
    tiers: [0,15,30,45,60]
    value_format_name: decimal_0
    sql: ${days_days_remaining} ;;
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

  dimension: model_year_bucket {
    type: tier
    style: integer
    tiers: [0,2000,2005,2010,2015,2017,2020]
    value_format_name: decimal_0
    sql: ${listingyear} ;;
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

  dimension: mileage_bucket {
    type: tier
    style: integer
    tiers: [0,5000,10000,15000,20000]
    value_format_name: decimal_0
    sql: ${mileage} ;;
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

  dimension: price_bucket {
    type: tier
    style: integer
    tiers: [0,10000,20000,30000,40000,50000,75000,100000]
    value_format_name: usd_0
    sql: ${price} ;;
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
