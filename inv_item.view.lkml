view: inv_item {
  sql_table_name: public.rumble_InvItem ;;

  dimension: accessories {
    type: string
    sql: ${TABLE}.Accessories ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.AccountId ;;
  }

  dimension: advent_stock_number {
    type: string
    sql: ${TABLE}.AdventStockNumber ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: appraisal_id {
    type: number
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: auction_buy_now_price {
    type: number
    sql: ${TABLE}.AuctionBuyNowPrice ;;
  }

  dimension: availability {
    type: number
    sql: ${TABLE}.Availability ;;
  }

  dimension: avl_status {
    type: number
    sql: ${TABLE}.AvlStatus ;;
  }

  dimension: base64_image {
    type: string
    sql: ${TABLE}.Base64Image ;;
  }

  dimension: body_style {
    type: string
    sql: ${TABLE}.BodyStyle ;;
  }

  dimension: clean_book {
    type: string
    sql: f_sql_parse_bookdata_clean(${TABLE}.BookData) ;;
  }

  dimension_group: book {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BookDate ;;
  }

  dimension: bore {
    type: string
    sql: ${TABLE}.Bore ;;
  }

  dimension: bucket_code {
    type: string
    sql: ${TABLE}.BucketCode ;;
  }

  dimension: bucket_id {
    type: number
    sql: ${TABLE}.BucketId ;;
  }

  dimension: buy_now_price {
    type: number
    sql: ${TABLE}.BuyNowPrice ;;
  }

  dimension: cached_image_urls {
    type: string
    sql: ${TABLE}.CachedImageUrls ;;
  }

  dimension: capp_id {
    type: number
    sql: ${TABLE}.capp_id ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.CategoryId ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.CategoryName ;;
  }

  dimension: category_type {
    type: string
    sql: ${TABLE}.CategoryType ;;
  }

  dimension_group: certified {
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
    sql: ${TABLE}.CertifiedDate ;;
  }

  dimension_group: checked_out {
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
    sql: ${TABLE}.CheckedOutDate ;;
  }

  dimension: checked_out_notes {
    type: string
    sql: ${TABLE}.CheckedOutNotes ;;
  }

  dimension: class_id {
    type: string
    sql: ${TABLE}.ClassId ;;
  }

  dimension: class_name {
    type: string
    sql: ${TABLE}.ClassName ;;
  }

  dimension: code_name {
    type: string
    sql: ${TABLE}.CodeName ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.Color ;;
  }

  dimension: comment1 {
    type: string
    sql: ${TABLE}.Comment1 ;;
  }

  dimension: comment2 {
    type: string
    sql: ${TABLE}.Comment2 ;;
  }

  dimension: comment3 {
    type: string
    sql: ${TABLE}.Comment3 ;;
  }

  dimension: comment4 {
    type: string
    sql: ${TABLE}.Comment4 ;;
  }

  dimension: comment5 {
    type: string
    sql: ${TABLE}.Comment5 ;;
  }

  dimension: compression_ratio {
    type: string
    sql: ${TABLE}.CompressionRatio ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  dimension: crdata {
    type: string
    sql: ${TABLE}.CRData ;;
  }

  dimension_group: created {
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
    type: number
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: crtype_id {
    type: number
    sql: ${TABLE}.CRTypeId ;;
  }

  dimension: curb_weight {
    type: string
    sql: ${TABLE}.CurbWeight ;;
  }

  dimension: damage_desc {
    type: string
    sql: ${TABLE}.DamageDesc ;;
  }

  dimension_group: damage_reported {
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
    sql: ${TABLE}.DamageReportedOn ;;
  }

  dimension: damage_reported_user_id {
    type: number
    sql: ${TABLE}.DamageReportedUserId ;;
  }

  dimension_group: damage_updated {
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
    sql: ${TABLE}.DamageUpdatedOn ;;
  }

  dimension: damage_updated_user_id {
    type: number
    sql: ${TABLE}.DamageUpdatedUserId ;;
  }

  dimension: dealer_inv_id {
    type: number
    sql: ${TABLE}.DealerInvId ;;
  }

  dimension: dealer_price {
    type: number
    sql: ${TABLE}.DealerPrice ;;
  }

  dimension: default_image_url {
    type: string
    sql: ${TABLE}.DefaultImageUrl ;;
  }

  dimension_group: delivered {
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
    sql: ${TABLE}.DeliveredDate ;;
  }

  dimension: delivered_notes {
    type: string
    sql: ${TABLE}.DeliveredNotes ;;
  }

  dimension: delivered_user_id {
    type: number
    sql: ${TABLE}.DeliveredUserId ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: downloaded_pixelz_photos {
    type: string
    sql: ${TABLE}.DownloadedPixelzPhotos ;;
  }

  dimension: drive_type_id {
    type: number
    sql: ${TABLE}.DriveTypeId ;;
  }

  dimension: durations {
    type: string
    sql: ${TABLE}.Durations ;;
  }

  dimension: emissions {
    type: string
    sql: ${TABLE}.Emissions ;;
  }

  dimension: engine {
    type: string
    sql: ${TABLE}.Engine ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.ExternalID ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.Family ;;
  }

  dimension: family_id {
    type: number
    sql: ${TABLE}.FamilyId ;;
  }

  dimension: final_drive {
    type: string
    sql: ${TABLE}.FinalDrive ;;
  }

  dimension: final_image_url {
    type: string
    sql: ${TABLE}.FinalImageURL ;;
  }

  dimension: freight_amount {
    type: number
    sql: ${TABLE}.FreightAmount ;;
  }

  dimension: from_home_net {
    type: string
    sql: ${TABLE}.FromHomeNet ;;
  }

  dimension: front_braking_system {
    type: string
    sql: ${TABLE}.FrontBrakingSystem ;;
  }

  dimension: front_suspension {
    type: string
    sql: ${TABLE}.FrontSuspension ;;
  }

  dimension: front_tire {
    type: string
    sql: ${TABLE}.FrontTire ;;
  }

  dimension: fuel {
    type: string
    sql: ${TABLE}.Fuel ;;
  }

  dimension: fuel_capacity {
    type: string
    sql: ${TABLE}.FuelCapacity ;;
  }

  dimension: fuel_economy {
    type: string
    sql: ${TABLE}.FuelEconomy ;;
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}.FuelType ;;
  }

  dimension: generic_type_id {
    type: number
    sql: ${TABLE}.GenericTypeId ;;
  }

  dimension: has_auction_photos {
    type: string
    sql: ${TABLE}.HasAuctionPhotos ;;
  }

  dimension: has_pixelz_photos {
    type: string
    sql: ${TABLE}.HasPixelzPhotos ;;
  }

  dimension: homenet_location {
    type: string
    sql: ${TABLE}.Homenet_Location ;;
  }

  dimension: ignition {
    type: string
    sql: ${TABLE}.Ignition ;;
  }

  dimension: image_urls {
    type: string
    sql: ${TABLE}.ImageUrls ;;
  }

  dimension: insta_vin_url {
    type: string
    sql: ${TABLE}.InstaVinURL ;;
  }

  dimension_group: insta_vin_urlcreated {
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
    sql: ${TABLE}.InstaVinURLCreatedDate ;;
  }

  dimension: interior_color {
    type: string
    sql: ${TABLE}.InteriorColor ;;
  }

  dimension: interior_type {
    type: string
    sql: ${TABLE}.InteriorType ;;
  }

  dimension: interiormaterial {
    type: string
    sql: ${TABLE}.INTERIORMATERIAL ;;
  }

  dimension: internet_price {
    type: number
    sql: ${TABLE}.InternetPrice ;;
  }

  dimension_group: inventory {
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
    sql: ${TABLE}.InventoryDate ;;
  }

  dimension: inventory_source {
    type: string
    sql: ${TABLE}.InventorySource ;;
  }

  dimension: invoice {
    type: string
    sql: ${TABLE}.Invoice ;;
  }

  dimension_group: invoice {
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
    sql: ${TABLE}.InvoiceDate ;;
  }

  dimension: invoice_value {
    type: number
    sql: ${TABLE}.InvoiceValue ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  dimension: is_book_value_pulled {
    type: string
    sql: ${TABLE}.IsBookValuePulled ;;
  }

  dimension: is_certified_photos {
    type: string
    sql: ${TABLE}.IsCertifiedPhotos ;;
  }

  dimension: is_checked_out {
    type: string
    sql: ${TABLE}.IsCheckedOut ;;
  }

  dimension: is_consignment {
    type: string
    sql: ${TABLE}.IsConsignment ;;
  }

  dimension: is_decoded {
    type: string
    sql: ${TABLE}.IsDecoded ;;
  }

  dimension: is_location_set_manually {
    type: string
    sql: ${TABLE}.IsLocationSetManually ;;
  }

  dimension: is_pay_pal {
    type: number
    sql: ${TABLE}.IsPayPal ;;
  }

  dimension: is_processed {
    type: string
    sql: ${TABLE}.IsProcessed ;;
  }

  dimension: item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ItemId ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.ItemName ;;
  }

  dimension: item_status_id {
    type: number
    sql: ${TABLE}.ItemStatusId ;;
  }

  dimension: item_year {
    type: number
    sql: ${TABLE}.ItemYear ;;
  }

  dimension: key_number {
    type: string
    sql: ${TABLE}.KeyNumber ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.LocationId ;;
  }

  dimension: location_notes {
    type: string
    sql: ${TABLE}.LocationNotes ;;
  }

  dimension: location_set_user_id {
    type: number
    sql: ${TABLE}.LocationSetUserId ;;
  }

  dimension: lvexternal_id {
    type: string
    sql: ${TABLE}.LVExternalId ;;
  }

  dimension: lvid {
    type: number
    value_format_name: id
    sql: ${TABLE}.LVId ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.Make ;;
  }

  dimension: make_id {
    type: number
    sql: ${TABLE}.MakeId ;;
  }

  dimension: make_type_id {
    type: number
    sql: ${TABLE}.MakeTypeID ;;
  }

  dimension: marketing_name {
    type: string
    sql: ${TABLE}.MarketingName ;;
  }

  dimension: mileage {
    type: number
    sql: ${TABLE}.Mileage ;;
  }

  dimension: mileage_notes {
    type: string
    sql: ${TABLE}.MileageNotes ;;
  }

  dimension: mm {
    type: string
    sql: ${TABLE}.MM ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.Model ;;
  }

  dimension: model_code {
    type: string
    sql: ${TABLE}.ModelCode ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.ModelId ;;
  }

  dimension: msrp {
    type: number
    sql: ${TABLE}.MSRP ;;
  }

  dimension: nada_stock_image_tried_once {
    type: string
    sql: ${TABLE}.NadaStockImageTriedOnce ;;
  }

  dimension: nadamodel_id {
    type: number
    sql: ${TABLE}.NADAModelId ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.Notes ;;
  }

  dimension: numberof_owners {
    type: string
    sql: ${TABLE}.NumberofOwners ;;
  }

  dimension_group: pay_pal_trans {
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
    sql: ${TABLE}.PayPalTransDate ;;
  }

  dimension_group: picked_up {
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
    sql: ${TABLE}.PickedUpDate ;;
  }

  dimension: picked_up_notes {
    type: string
    sql: ${TABLE}.PickedUpNotes ;;
  }

  dimension: picked_up_user_id {
    type: number
    sql: ${TABLE}.PickedUpUserId ;;
  }

  dimension: pickup_address1 {
    type: string
    sql: ${TABLE}.PickupAddress1 ;;
  }

  dimension: pickup_address2 {
    type: string
    sql: ${TABLE}.PickupAddress2 ;;
  }

  dimension_group: pickup_booked {
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
    sql: ${TABLE}.PickupBookedDate ;;
  }

  dimension: pickup_city {
    type: string
    sql: ${TABLE}.PickupCity ;;
  }

  dimension: pickup_contact {
    type: string
    sql: ${TABLE}.PickupContact ;;
  }

  dimension: pickup_country {
    type: string
    sql: ${TABLE}.PickupCountry ;;
  }

  dimension: pickup_state {
    type: location
    sql: ${TABLE}.PickupState ;;
  }

  dimension: pickup_zip {
    type: string
    sql: ${TABLE}.PickupZip ;;
  }

  dimension: prep {
    type: string
    sql: ${TABLE}.Prep ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}.PRICE ;;
  }

  dimension: processed_image_url {
    type: string
    sql: ${TABLE}.ProcessedImageURL ;;
  }

  dimension: pulled_book_values {
    type: string
    sql: ${TABLE}.PulledBookValues ;;
  }

  dimension: rake_trail {
    type: string
    sql: ${TABLE}.RakeTrail ;;
  }

  dimension: rare_tire {
    type: string
    sql: ${TABLE}.RareTire ;;
  }

  dimension: rear_braking_system {
    type: string
    sql: ${TABLE}.RearBrakingSystem ;;
  }

  dimension: rear_suspension {
    type: string
    sql: ${TABLE}.RearSuspension ;;
  }

  dimension: recon {
    type: number
    sql: ${TABLE}.Recon ;;
  }

  dimension_group: recon {
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
    sql: ${TABLE}.ReconDate ;;
  }

  dimension: recon_notes {
    type: string
    sql: ${TABLE}.ReconNotes ;;
  }

  dimension: recon_user_id {
    type: number
    sql: ${TABLE}.ReconUserId ;;
  }

  dimension: reserve_price {
    type: number
    sql: ${TABLE}.ReservePrice ;;
  }

  dimension_group: reserved_until {
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
    sql: ${TABLE}.ReservedUntil ;;
  }

  dimension_group: retail_site_end {
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
    sql: ${TABLE}.RetailSiteEndTime ;;
  }

  dimension: seat_height {
    type: string
    sql: ${TABLE}.SeatHeight ;;
  }

  dimension: series {
    type: string
    sql: ${TABLE}.Series ;;
  }

  dimension_group: shipping_booked {
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
    sql: ${TABLE}.ShippingBookedDate ;;
  }

  dimension: shipping_booked_notes {
    type: string
    sql: ${TABLE}.ShippingBookedNotes ;;
  }

  dimension: shipping_booked_user_id {
    type: number
    sql: ${TABLE}.ShippingBookedUserId ;;
  }

  dimension_group: shipping_issue {
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
    sql: ${TABLE}.ShippingIssueDate ;;
  }

  dimension: shipping_issue_notes {
    type: string
    sql: ${TABLE}.ShippingIssueNotes ;;
  }

  dimension: shipping_issue_user_id {
    type: number
    sql: ${TABLE}.ShippingIssueUserId ;;
  }

  dimension: shipping_status_id {
    type: number
    sql: ${TABLE}.ShippingStatusId ;;
  }

  dimension: source {
    type: number
    sql: ${TABLE}.SOURCE ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}.SourceName ;;
  }

  dimension: stock_no {
    type: string
    sql: ${TABLE}.StockNo ;;
  }

  dimension: stock_type {
    type: string
    sql: ${TABLE}.StockType ;;
  }

  dimension: stock_type_id {
    type: number
    sql: ${TABLE}.StockTypeId ;;
  }

  dimension: stroke {
    type: string
    sql: ${TABLE}.Stroke ;;
  }

  dimension: title_attached {
    type: yesno
    sql: ${TABLE}.titleattached ;;
  }
  dimension: transmission {
    type: string
    sql: ${TABLE}.Transmission ;;
  }

  dimension: transmission_type_id {
    type: number
    sql: ${TABLE}.TransmissionTypeId ;;
  }

  dimension: trim {
    type: string
    sql: ${TABLE}.TRIM ;;
  }

  dimension_group: updated {
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
    type: number
    sql: ${TABLE}.UpdatedUserId ;;
  }

  dimension: valve_train {
    type: string
    sql: ${TABLE}.ValveTrain ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.VIN ;;
  }

  dimension: weblink_url {
    type: string
    sql: ${TABLE}.WeblinkUrl ;;
  }

  dimension: wheel_base {
    type: string
    sql: ${TABLE}.WheelBase ;;
  }

  dimension: ym {
    type: string
    sql: ${TABLE}.YM ;;
  }

  dimension: ymm {
    type: string
    sql: ${TABLE}.YMM ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      item_name,
      category_name,
      class_name,
      code_name,
      marketing_name,
      source_name
    ]
  }
}
