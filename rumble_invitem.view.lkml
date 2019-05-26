view: rumble_invitem {
  sql_table_name: public.rumble_invitem ;;

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

  dimension: accountid {
    type: number
    value_format_name: id
    sql: ${TABLE}.accountid ;;
  }

  dimension: adventstocknumber {
    type: string
    sql: ${TABLE}.adventstocknumber ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: appraisalid {
    type: number
    value_format_name: id
    sql: ${TABLE}.appraisalid ;;
  }

  dimension: auctionbuynowprice {
    type: number
    sql: ${TABLE}.auctionbuynowprice ;;
  }

  dimension: auctionsalefee {
    type: number
    sql: ${TABLE}.auctionsalefee ;;
  }

  dimension: avlstatus {
    type: number
    sql: ${TABLE}.avlstatus ;;
  }

  dimension: bbmodelid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bbmodelid ;;
  }

  dimension: blocknotes {
    type: string
    sql: ${TABLE}.blocknotes ;;
  }

  dimension: bodystyle {
    type: string
    sql: ${TABLE}.bodystyle ;;
  }

  dimension: bookdata {
    type: string
    sql: ${TABLE}.bookdata ;;
  }

  dimension: bookdatanew {
    type: string
    sql: ${TABLE}.bookdatanew ;;
  }

  dimension_group: bookdate {
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
    sql: ${TABLE}.bookdate ;;
  }

  dimension: bucketid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bucketid ;;
  }

  dimension: buyfee {
    type: number
    sql: ${TABLE}.buyfee ;;
  }

  dimension: buynowprice {
    type: number
    sql: ${TABLE}.buynowprice ;;
  }

  dimension: caroptions {
    type: string
    sql: ${TABLE}.caroptions ;;
  }

  dimension: categoryid {
    type: number
    value_format_name: id
    sql: ${TABLE}.categoryid ;;
  }

  dimension: categoryname {
    type: string
    sql: ${TABLE}.categoryname ;;
  }

  dimension: categorytype {
    type: string
    sql: ${TABLE}.categorytype ;;
  }

  dimension_group: certifieddate {
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
    sql: ${TABLE}.certifieddate ;;
  }

  dimension: citymileage {
    type: number
    sql: ${TABLE}.citymileage ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
  }

  dimension: comment1 {
    type: string
    sql: ${TABLE}.comment1 ;;
  }

  dimension: comment2 {
    type: string
    sql: ${TABLE}.comment2 ;;
  }

  dimension: comment3 {
    type: string
    sql: ${TABLE}.comment3 ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: crdata {
    type: string
    sql: ${TABLE}.crdata ;;
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

  dimension: createduserid {
    type: number
    value_format_name: id
    sql: ${TABLE}.createduserid ;;
  }

  dimension: crtypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.crtypeid ;;
  }

  dimension: cylinders {
    type: number
    sql: ${TABLE}.cylinders ;;
  }

  dimension: dealerprice {
    type: number
    sql: ${TABLE}.dealerprice ;;
  }

  dimension: dealership {
    type: string
    sql: ${TABLE}.dealership ;;
  }

  dimension_group: delivereddate {
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
    sql: ${TABLE}.delivereddate ;;
  }

  dimension: deliverednotes {
    type: string
    sql: ${TABLE}.deliverednotes ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: downloadedpixelzphotos {
    type: number
    sql: ${TABLE}.downloadedpixelzphotos ;;
  }

  dimension: drivetrain {
    type: string
    sql: ${TABLE}.drivetrain ;;
  }

  dimension: engine {
    type: string
    sql: ${TABLE}.engine ;;
  }

  dimension: externalsourceid {
    type: string
    sql: ${TABLE}.externalsourceid ;;
  }

  dimension: finalimageurl {
    type: string
    sql: ${TABLE}.finalimageurl ;;
  }

  dimension: freightamount {
    type: number
    sql: ${TABLE}.freightamount ;;
  }

  dimension: fromhomenet {
    type: number
    sql: ${TABLE}.fromhomenet ;;
  }

  dimension: fuel {
    type: string
    sql: ${TABLE}.fuel ;;
  }

  dimension: fueltype {
    type: string
    sql: ${TABLE}.fueltype ;;
  }

  dimension: hasauctionphotos {
    type: number
    sql: ${TABLE}.hasauctionphotos ;;
  }

  dimension: haspixelzphotos {
    type: number
    sql: ${TABLE}.haspixelzphotos ;;
  }

  dimension: highwaymileage {
    type: number
    sql: ${TABLE}.highwaymileage ;;
  }

  dimension: homenet_location {
    type: string
    sql: ${TABLE}.homenet_location ;;
  }

  dimension: imageurls {
    type: string
    sql: ${TABLE}.imageurls ;;
  }

  dimension: interiorcolor {
    type: string
    sql: ${TABLE}.interiorcolor ;;
  }

  dimension: interiortype {
    type: string
    sql: ${TABLE}.interiortype ;;
  }

  dimension: internetprice {
    type: number
    sql: ${TABLE}.internetprice ;;
  }

  dimension_group: inventorydate {
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
    sql: ${TABLE}.inventorydate ;;
  }

  dimension: invitemtypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.invitemtypeid ;;
  }

  dimension: invoicevalue {
    type: number
    sql: ${TABLE}.invoicevalue ;;
  }

  dimension: isactive {
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: isauctionphotossent {
    type: number
    sql: ${TABLE}.isauctionphotossent ;;
  }

  dimension: iscertifiedphotos {
    type: number
    sql: ${TABLE}.iscertifiedphotos ;;
  }

  dimension: ischeckedout {
    type: number
    sql: ${TABLE}.ischeckedout ;;
  }

  dimension: isconsignment {
    type: number
    sql: ${TABLE}.isconsignment ;;
  }

  dimension: islocationsetmanually {
    type: number
    sql: ${TABLE}.islocationsetmanually ;;
  }

  dimension: ispaypal {
    type: number
    sql: ${TABLE}.ispaypal ;;
  }

  dimension: isphotossent {
    type: number
    sql: ${TABLE}.isphotossent ;;
  }

  dimension: isprocessed {
    type: number
    sql: ${TABLE}.isprocessed ;;
  }

  dimension: istmu {
    type: number
    sql: ${TABLE}.istmu ;;
  }

  dimension: iswashedauctionphotosreceived {
    type: number
    sql: ${TABLE}.iswashedauctionphotosreceived ;;
  }

  dimension: iswashedphotosreceived {
    type: number
    sql: ${TABLE}.iswashedphotosreceived ;;
  }

  dimension: itemid {
    type: number
    value_format_name: id
    sql: ${TABLE}.itemid ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}.itemname ;;
  }

  dimension: itemstatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}.itemstatusid ;;
  }

  dimension: itemyear {
    type: number
    sql: ${TABLE}.itemyear ;;
  }

  dimension: locationid {
    type: number
    value_format_name: id
    sql: ${TABLE}.locationid ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: maketypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.maketypeid ;;
  }

  dimension: manheimmodelid {
    type: number
    value_format_name: id
    sql: ${TABLE}.manheimmodelid ;;
  }

  dimension: marketingcategory {
    type: string
    sql: ${TABLE}.marketingcategory ;;
  }

  dimension: mileage {
    type: number
    sql: ${TABLE}.mileage ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: modelcode {
    type: string
    sql: ${TABLE}.modelcode ;;
  }

  dimension: msrp {
    type: number
    sql: ${TABLE}.msrp ;;
  }

  dimension: nadamodelid {
    type: number
    value_format_name: id
    sql: ${TABLE}.nadamodelid ;;
  }

  dimension: nadastockimagetriedonce {
    type: number
    sql: ${TABLE}.nadastockimagetriedonce ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: otherfees {
    type: number
    sql: ${TABLE}.otherfees ;;
  }

  dimension_group: pickedupdate {
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
    sql: ${TABLE}.pickedupdate ;;
  }

  dimension: pickedupnotes {
    type: string
    sql: ${TABLE}.pickedupnotes ;;
  }

  dimension: pickupaddress1 {
    type: string
    sql: ${TABLE}.pickupaddress1 ;;
  }

  dimension: pickupaddress2 {
    type: string
    sql: ${TABLE}.pickupaddress2 ;;
  }

  dimension: pickupcity {
    type: string
    sql: ${TABLE}.pickupcity ;;
  }

  dimension: pickupcontact {
    type: string
    sql: ${TABLE}.pickupcontact ;;
  }

  dimension: pickupcountry {
    type: string
    sql: ${TABLE}.pickupcountry ;;
  }

  dimension: pickupemail {
    type: string
    sql: ${TABLE}.pickupemail ;;
  }

  dimension: pickuplocation {
    type: string
    sql: ${TABLE}.pickuplocation ;;
  }

  dimension: pickupmobile {
    type: string
    sql: ${TABLE}.pickupmobile ;;
  }

  dimension: pickupstate {
    type: string
    sql: ${TABLE}.pickupstate ;;
  }

  dimension: pickupzip {
    type: string
    sql: ${TABLE}.pickupzip ;;
  }

  dimension: postsalecharges {
    type: number
    sql: ${TABLE}.postsalecharges ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: processedimageurl {
    type: string
    sql: ${TABLE}.processedimageurl ;;
  }

  dimension: purchaseprice {
    type: number
    sql: ${TABLE}.purchaseprice ;;
  }

  dimension: purchasetype {
    type: string
    sql: ${TABLE}.purchasetype ;;
  }

  dimension: recon {
    type: number
    sql: ${TABLE}.recon ;;
  }

  dimension_group: recondate {
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
    sql: ${TABLE}.recondate ;;
  }

  dimension: reconnotes {
    type: string
    sql: ${TABLE}.reconnotes ;;
  }

  dimension_group: recordopendatetime {
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
    sql: ${TABLE}.recordopendatetime ;;
  }

  dimension: recordopenuser {
    type: number
    sql: ${TABLE}.recordopenuser ;;
  }

  dimension: reserveprice {
    type: number
    sql: ${TABLE}.reserveprice ;;
  }

  dimension_group: retailsiteendtime {
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
    sql: ${TABLE}.retailsiteendtime ;;
  }

  dimension: salvagehistory {
    type: string
    sql: ${TABLE}.salvagehistory ;;
  }

  dimension: sellnet {
    type: number
    sql: ${TABLE}.sellnet ;;
  }

  dimension: series {
    type: string
    sql: ${TABLE}.series ;;
  }

  dimension: shippingaddress {
    type: string
    sql: ${TABLE}.shippingaddress ;;
  }

  dimension: shippingaddress2 {
    type: string
    sql: ${TABLE}.shippingaddress2 ;;
  }

  dimension_group: shippingbookeddate {
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
    sql: ${TABLE}.shippingbookeddate ;;
  }

  dimension: shippingbookednotes {
    type: string
    sql: ${TABLE}.shippingbookednotes ;;
  }

  dimension: shippingcity {
    type: string
    sql: ${TABLE}.shippingcity ;;
  }

  dimension: shippingcontact {
    type: string
    sql: ${TABLE}.shippingcontact ;;
  }

  dimension: shippingcontactemail {
    type: string
    sql: ${TABLE}.shippingcontactemail ;;
  }

  dimension: shippingcontactmobile {
    type: string
    sql: ${TABLE}.shippingcontactmobile ;;
  }

  dimension: shippingdestination {
    type: string
    sql: ${TABLE}.shippingdestination ;;
  }

  dimension_group: shippingissuedate {
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
    sql: ${TABLE}.shippingissuedate ;;
  }

  dimension: shippingstate {
    type: string
    sql: ${TABLE}.shippingstate ;;
  }

  dimension: shippingstatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}.shippingstatusid ;;
  }

  dimension: shippingzip {
    type: number
    sql: ${TABLE}.shippingzip ;;
  }

  dimension_group: solddate {
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
    sql: ${TABLE}.solddate ;;
  }

  dimension: soldprice {
    type: number
    sql: ${TABLE}.soldprice ;;
  }

  dimension: source {
    type: number
    sql: ${TABLE}.source ;;
  }

  dimension: sourceaccountid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sourceaccountid ;;
  }

  dimension: sourcename {
    type: string
    sql: ${TABLE}.sourcename ;;
  }

  dimension: stockno {
    type: string
    sql: ${TABLE}.stockno ;;
  }

  dimension: stocktypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.stocktypeid ;;
  }

  dimension: titleattached {
    type: number
    sql: ${TABLE}.titleattached ;;
  }

  dimension: transmission {
    type: string
    sql: ${TABLE}.transmission ;;
  }

  dimension: trim {
    type: string
    sql: ${TABLE}.trim ;;
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

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      __schemaname,
      __tablename,
      sourcename,
      categoryname,
      itemname
    ]
  }
}
