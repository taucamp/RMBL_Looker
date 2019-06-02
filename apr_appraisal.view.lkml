view: apr_appraisal {
  sql_table_name: public.rumble_AprAppraisal ;;

  set: appraisal_drillthrough {
    fields: [appraisal_ref_no,
      appraisal_id,
      vin,
      appraised_date,
      make,
      model,
      mileage,
      appraised_amount,
      nada_clean_value

    ]
  }
  dimension: appraisal_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: account_id {
    type: number
    hidden: yes
    sql: ${TABLE}.AccountId ;;
  }

  dimension: advent_opportunity_guid {
    type: string
    hidden: yes
    sql: ${TABLE}.AdventOpportunityGuid ;;
  }

  dimension: appraisal_offer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.AppraisalOfferId ;;
  }

  dimension: appraisal_ref_no {
    type: string
    hidden: yes
    sql: ${TABLE}.AppraisalRefNo ;;
  }

  dimension: appraisal_status_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.AppraisalStatusId,0) ;;
  }

  dimension: appraised_amount {
    type: number
    sql: nvl(${TABLE}.AppraisedAmount,0) ;;
  }

  dimension: appraised_amount_bucket {
    type: tier
    tiers: [0,10000,20000,30000,40000,50000,75000,100000]
    style: relational
    sql: ${appraised_amount} ;;
    value_format_name: usd_0
  }

  dimension_group: appraised {
    group_label:"Dates"
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
    sql: ${TABLE}.AppraisedDate ;;
  }

  dimension: appraiser_notes {
    type: string
    hidden: yes
    sql: nvl(${TABLE}.AppraiserNotes,'Unknown') ;;
  }

  dimension: appraiser_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.AppraiserUserId,0) ;;
  }

  dimension_group: assigned_to {
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
    sql: ${TABLE}.AssignedToDate ;;
  }

  dimension: assigned_to_notes {
    type: string
    hidden: yes
    sql: nvl(${TABLE}.AssignedToNotes,'Unknown')  ;;
  }

  dimension: assigned_to_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.AssignedToUserId,0) ;;
  }

  dimension: book_data {
    type: string
    hidden: yes
    sql: ${TABLE}.BookData ;;
  }

  dimension_group: book {
    group_label:"Dates"
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
    sql: ${TABLE}.BookDate ;;
  }

  dimension: client_ipaddress {
    type: string
    hidden: yes
    sql: nvl(${TABLE}.ClientIPAddress,'Unknown') ;;
  }

  dimension: client_user_agent {
    type: string
    hidden: yes
    sql: nvl(${TABLE}.ClientUserAgent,'Unknown') ;;
  }

  dimension: color {
    type: string
    sql: nvl(${TABLE}.Color,'Unknown') ;;
  }

  dimension_group: created {
    group_label:"Dates"
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
    hidden: yes
    sql: nvl(${TABLE}.CreatedUserId,0) ;;
  }

  # dimension: current_step {
  #   type: string
  #   hidden: yes
  #   sql: ${TABLE}.CurrentStep ;;
  # }

  dimension: current_step_no {
    type: number
    sql: nvl(${TABLE}.CurrentStepNo,0) ;;
  }

  dimension_group: customer_contacted {
    group_label:"Dates"
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
    sql: ${TABLE}.CustomerContactedDate ;;
  }

  dimension: customer_contacted_notes {
    type: string
    hidden: yes
    sql: nvl(${TABLE}.CustomerContactedNotes, 'Unknown') ;;
  }

  dimension: customer_contacted_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.CustomerContactedUserId,0) ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.CustomerId,0) ;;
  }

  dimension: customer_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.CustomerNotes ;;
  }

  dimension_group: customer_notified {
    group_label:"Dates"
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
    sql: ${TABLE}.CustomerNotifiedDate ;;
  }

  dimension: customer_notified_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.CustomerNotifiedNotes ;;
  }

  dimension: customer_notified_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.CustomerNotifiedUserId,0) ;;
  }

  dimension_group: customer_submitted {
    group_label:"Dates"
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
    sql: ${TABLE}.CustomerSubmittedDate ;;
  }

  dimension: damage_description {
    type: string
    hidden: yes
    sql: ${TABLE}.DamageDescription ;;
  }

  dimension_group: dead_deal {
    group_label:"Dates"
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
    sql: ${TABLE}.DeadDealDate ;;
  }

  dimension: dead_deal_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.DeadDealNotes ;;
  }

  dimension: dead_deal_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.DeadDealUserId ;;
  }

  dimension_group: delivered {
    group_label:"Dates"
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
    hidden: yes
    sql: ${TABLE}.DeliveredNotes ;;
  }

  dimension: delivered_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DeliveredUserId,0) ;;
  }

  dimension_group: destination_location {
    group_label:"Dates"
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
    sql: ${TABLE}.DestinationLocationDate ;;
  }

  dimension: destination_location_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.DestinationLocationNotes ;;
  }

  dimension: destination_location_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DestinationLocationUserId,0) ;;
  }

  dimension_group: destination_type {
    group_label:"Dates"
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
    sql: ${TABLE}.DestinationTypeDate ;;
  }

  dimension: destination_type_id {
    type: number
    hidden: yes
    sql: ${TABLE}.DestinationTypeId ;;
  }

  dimension: destination_type_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.DestinationTypeNotes ;;
  }

  dimension: destination_type_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DestinationTypeUserId,0) ;;
  }

  dimension_group: doc_in {
    group_label:"Dates"
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
    sql: ${TABLE}.DocInDate ;;
  }

  dimension_group: doc_out {
    group_label:"Dates"
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
    sql: ${TABLE}.DocOutDate ;;
  }

  dimension: document_signed_by {
    group_label:"Dates"
    type: string
    hidden: yes
    sql: ${TABLE}.DocumentSignedBy ;;
  }

  dimension_group: document_upload {
    group_label:"Dates"
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
    sql: ${TABLE}.DocumentUploadDate ;;
  }

  dimension_group: documents_issue {
    group_label:"Dates"
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
    sql: ${TABLE}.DocumentsIssueDate ;;
  }

  dimension: documents_issue_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.DocumentsIssueNotes ;;
  }

  dimension: documents_issue_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DocumentsIssueUserId,0) ;;
  }

  dimension: documents_returned_courier_type_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DocumentsReturnedCourierTypeId,0) ;;
  }

  dimension_group: documents_returned {
    group_label:"Dates"
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
    sql: ${TABLE}.DocumentsReturnedDate ;;
  }

  dimension: documents_returned_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.DocumentsReturnedNotes ;;
  }

  dimension: documents_returned_tracking_no {
    type: string
    hidden: yes
    sql: ${TABLE}.DocumentsReturnedTrackingNo ;;
  }

  dimension: documents_returned_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DocumentsReturnedUserId,0 ;;
  }

  dimension: documents_sent_courier_type_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DocumentsSentCourierTypeId,0) ;;
  }

  dimension_group: documents_sent {
    group_label:"Dates"
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
    sql: ${TABLE}.DocumentsSentDate ;;
  }

  dimension: documents_sent_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.DocumentsSentNotes ;;
  }

  dimension: documents_sent_tracking_no {
    type: string
    hidden: yes
    sql: ${TABLE}.DocumentsSentTrackingNo ;;
  }

  dimension: documents_sent_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DocumentsSentUserId,0) ;;
  }

  dimension: documents_specialist_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DocumentsSpecialistUserId,0) ;;
  }

  dimension_group: documents_verified {
    group_label:"Dates"
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
    sql: ${TABLE}.DocumentsVerifiedDate ;;
  }

  dimension: documents_verified_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.DocumentsVerifiedNotes ;;
  }

  dimension: documents_verified_user_id {
    type: number
    hidden: yes
    sql: nvl(${TABLE}.DocumentsVerifiedUserId,0) ;;
  }

  dimension: equipment_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.EquipmentNotes ;;
  }

  dimension: est_freight {
    type: number
    sql: ${TABLE}.EstFreight ;;
  }

  dimension: est_recon {
    type: number
    sql: ${TABLE}.EstRecon ;;
  }

  dimension_group: first_contact {
    group_label:"Dates"
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
    sql: ${TABLE}.FirstContact ;;
  }

  dimension_group: follow_up_call {
    group_label:"Dates"
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
    sql: ${TABLE}.FollowUpCallDate ;;
  }

  dimension: has_been_operated {
    type: yesno
    sql: nvl2(${TABLE}.HasBeenOperated,0,1) = 1 ;;
  }

  dimension: has_damage {
    type: yesno
    sql: nvl2(${TABLE}.HasDamage,0,1) = 1 ;;
  }

  dimension: has_photos {
    type: yesno
    sql: nvl2(${TABLE}.HasPhotos,0,1) = 1 ;;
  }

  dimension: have_outstanding_loan {
    type: yesno
    sql: nvl2(${TABLE}.HaveOutstandingLoan,0,1) = 1 ;;
  }

  dimension: internet_price {
    type: number
    sql: ${TABLE}.InternetPrice ;;
  }

  dimension: is_offer_lessthan_owe {
    type: yesno
    sql: nvl2(${TABLE}.IsOfferLessthanOwe,0,1) = 1 ;;
  }

  dimension: is_photo_confirmed {
    type: yesno
    sql: nvl2(${TABLE}.IsPhotoConfirmed,0,1) = 1 ;;
  }

  dimension: is_photo_ready {
    type: yesno
    sql: nvl2(${TABLE}.IsPhotoReady,0,1) = 1 ;;
  }

  dimension: is_photo_rejected {
    type: yesno
    sql: nvl2(${TABLE}.IsPhotoRejected,0,1) = 1 ;;
  }

  dimension: item_guid {
    type: string
    hidden:yes
    sql: ${TABLE}.ItemGuid ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.ItemName ;;
  }

  dimension: item_type_id {
    type: number
    sql: nvl(${TABLE}.ItemTypeId,0) ;;
  }

  dimension: item_year {
    type: number
    sql: ${TABLE}.ItemYear ;;
  }

  dimension: listing_type_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.ListingTypeId,0) ;;
  }

  dimension: location_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.LocationId,0) ;;
  }

  dimension_group: locked {
    group_label:"Dates"
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
    sql: ${TABLE}.LockedDate ;;
  }

  dimension: locked_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.LockedNotes ;;
  }

  dimension: locked_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.LockedUserId,0) ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.Make ;;
  }

  dimension: is_harley {
    type: string
    sql: f_sql_harley(${TABLE}.Make) ;;
  }


  dimension: mechanical_condition_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.MechanicalConditionId,0) ;;
  }

  dimension: mileage {
    type: number
    sql: ${TABLE}.Mileage ;;
  }

  dimension: mileage_bucket {
    type: tier
    tiers: [0,5000,10000,15000,20000]
    style:  integer
    sql: ${TABLE}.Mileage;;
    value_format_name: decimal_0
  }

  dimension: minimum_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.MinimumBid ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.Model ;;
  }

  dimension: motorcycle_rating {
    type: string
    sql: nvl(${TABLE}.MotorcycleRating,'Unknown') ;;
  }

  dimension: nada_clean_value {
    type: number
    sql: ${TABLE}.NadaCleanValue ;;
  }

  dimension: nada_model_id {
    type: number
    sql: ${TABLE}.NadaModelId ;;
  }

  dimension_group: opened {
    group_label:"Dates"
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
    sql: ${TABLE}.OpenedDate ;;
  }

  dimension: overall_condition_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.OverallConditionId,0) ;;
  }

  dimension: owner2_address1 {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2Address1 ;;
  }

  dimension: owner2_address {
    hidden: yes
    type: string
    sql:  CASE
            WHEN ${owner2_address2} IS NOT NULL
              THEN ${owner_address1} || ' ' || ${owner_address2}
            ELSE ${owner2_address1}
          END ;;
  }

  dimension: owner2_address2 {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2Address2 ;;
  }

  dimension: owner2_city {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2City ;;
    drill_fields: [owner2_zip, owner2_address]
  }

  dimension: owner2_country {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2Country ;;
    drill_fields: [owner2_state, owner2_city, owner2_zip, owner2_address]
  }

  dimension: owner2_email {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2Email ;;
  }

  dimension: owner2_home_phone {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2HomePhone ;;
  }

  dimension: owner2_legal_name {
    type: string
    sql: ${TABLE}.Owner2LegalName ;;
  }

  dimension: owner2_mobile {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2Mobile ;;
  }

  dimension: owner2_office_phone {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2OfficePhone ;;
  }

  dimension: owner2_state {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2State ;;
    drill_fields: [owner2_city, owner2_zip, owner2_address]
  }

  dimension: owner2_zip {
    type: string
    hidden:yes
    sql: ${TABLE}.Owner2Zip ;;
    drill_fields: [owner2_address]
  }

  dimension: owner_address1 {
    type: string
    hidden:yes
    sql: ${TABLE}.OwnerAddress1 ;;
  }

  dimension: owner_address2 {
    type: string
    hidden:yes
    sql: ${TABLE}.OwnerAddress2 ;;
  }

  dimension: owner_address {
    hidden: yes
    type: string
    sql:  CASE
            WHEN ${owner_address2} IS NOT NULL
              THEN ${owner_address1} || ' ' || ${owner_address2}
            ELSE ${owner_address1}
          END ;;
  }

  dimension: owner_city {
    type: string
    sql: ${TABLE}.OwnerCity ;;
    drill_fields: [owner_zip, owner_address]
  }

  dimension: owner_country {
    type: string
    sql: ${TABLE}.OwnerCountry ;;
    drill_fields: [owner_state, owner_city, owner_zip, owner_address]
  }

  dimension: owner_email {
    type: string
    sql: ${TABLE}.OwnerEmail ;;
  }

  dimension: owner_home_phone {
    type: string
    hidden:yes
    sql: ${TABLE}.OwnerHomePhone ;;
  }

  dimension: owner_legal_name {
    type: string
    hidden:yes
    sql: ${TABLE}.OwnerLegalName ;;
  }

  dimension: owner_mobile {
    type: string
    hidden:yes
    sql: ${TABLE}.OwnerMobile ;;
  }

  dimension: owner_office_phone {
    type: string
    hidden:yes
    sql: ${TABLE}.OwnerOfficePhone ;;
  }

  dimension: owner_state {
    type: string
    sql: ${TABLE}.OwnerState ;;
    drill_fields: [owner_city, owner_zip, owner_address]
  }

  dimension: owner_zip {
    type: string
    sql: ${TABLE}.OwnerZip ;;
    drill_fields: [owner_address]
  }

  dimension: payment_amount {
    type: number
    sql: ${TABLE}.PaymentAmount ;;
  }

  dimension_group: payment {
    group_label:"Dates"
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
    sql: ${TABLE}.PaymentDate ;;
  }

  dimension_group: payment_issue {
    group_label:"Dates"
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
    sql: ${TABLE}.PaymentIssueDate ;;
  }

  dimension: payment_issue_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.PaymentIssueNotes ;;
  }

  dimension: payment_issue_type_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.PaymentIssueTypeId,0) ;;
  }

  dimension: payment_issue_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.PaymentIssueUserId,0) ;;
  }

  dimension: payment_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.PaymentNotes ;;
  }

  dimension: payment_type_id {
    type: number
    hidden:yes
    sql: ${TABLE}.PaymentTypeId ;;
  }

  dimension: payment_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.PaymentUserId,0) ;;
  }

  dimension_group: photo_confirmed {
    group_label:"Dates"
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
    sql: ${TABLE}.PhotoConfirmedDate ;;
  }

  dimension_group: photo_ready {
    group_label:"Dates"
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
    sql: ${TABLE}.PhotoReadyDate ;;
  }

  dimension_group: photo_rejected {
    group_label:"Dates"
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
    sql: ${TABLE}.PhotoRejectedDate ;;
  }

  dimension: physical_condition_id {
    type: number
    hidden:yes
    sql: isnull(${TABLE}.PhysicalConditionId,0) ;;
  }

  dimension_group: picked_up {
    group_label:"Dates"
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
    hidden:yes
    sql: ${TABLE}.PickedUpNotes ;;
  }

  dimension: picked_up_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.PickedUpUserId,0) ;;
  }

  dimension: pickup_address1 {
    type: string
    hidden:yes
    sql: ${TABLE}.PickupAddress1 ;;
  }

  dimension: pickup_address2 {
    type: string
    hidden:yes
    sql: ${TABLE}.PickupAddress2 ;;
  }

  dimension: pickup_address {
    hidden: yes
    type: string
    sql:  CASE
            WHEN ${pickup_address1} IS NOT NULL
              THEN ${pickup_address1} || ' ' || ${pickup_address2}
            ELSE ${pickup_address1}
          END ;;
  }

  dimension: is_pickup_address_different {
    type: yesno
    sql: nvl2(${TABLE}.PickupAddressDifferent,0,1) = 1 ;;
  }

  dimension: pickup_city {
    type: string
    sql: ${TABLE}.PickupCity ;;
    drill_fields: [pickup_zip, pickup_address]
  }

  dimension: pickup_contact {
    type: string
    hidden:yes
    sql: ${TABLE}.PickupContact ;;
  }

  dimension: is_pickup_contact_different {
    type: yesno
    hidden:yes
    sql: nvl2(${TABLE}.PickupContactDifferent,0,1) = 1 ;;
  }

  dimension: pickup_country {
    type: string
    sql: ${TABLE}.PickupCountry ;;
    drill_fields: [pickup_state, pickup_city, pickup_zip, pickup_address]
  }

  dimension: pickup_email {
    type: string
    hidden:yes
    sql: ${TABLE}.PickupEmail ;;
  }

  dimension: pickup_home_phone {
    type: string
    hidden:yes
    sql: ${TABLE}.PickupHomePhone ;;
  }

  dimension: pickup_mobile {
    type: string
    hidden:yes
    sql: ${TABLE}.PickupMobile ;;
  }

  dimension: pickup_office_phone {
    type: string
    hidden:yes
    sql: ${TABLE}.PickupOfficePhone ;;
  }

  dimension: pickup_state {
    type: string
    sql: ${TABLE}.PickupState ;;
    drill_fields: [pickup_city, pickup_zip, pickup_address]
  }

  dimension: pickup_zip {
    type: string
    sql: ${TABLE}.PickupZip ;;
    drill_fields: [pickup_address]
  }

  dimension: preferred_contact_method {
    type: string
    hidden:yes
    sql: ${TABLE}.preferredcontactmethod ;;
  }

  dimension: promo_code {
    type: string
    hidden:yes
    sql: ${TABLE}.PromoCode ;;
  }

  dimension_group: receipt_confirmed {
    group_label:"Dates"
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
    sql: ${TABLE}.ReceiptConfirmedDate ;;
  }

  dimension: receipt_confirmed_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.ReceiptConfirmedNotes ;;
  }

  dimension: receipt_confirmed_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.ReceiptConfirmedUserId,0) ;;
  }

  dimension: reserve_price {
    type: number
    sql: ${TABLE}.ReservePrice ;;
  }

  dimension_group: save_adeal {
    group_label:"Dates"
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
    sql: ${TABLE}.SaveADealDate ;;
  }

  dimension: save_adeal_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.SaveADealNotes ;;
  }

  dimension: save_adeal_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.SaveADealUserId,0) ;;
  }

  dimension_group: second_contact {
    group_label:"Dates"
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
    sql: ${TABLE}.SecondContact ;;
  }

  dimension: series {
    type: string
    sql: ${TABLE}.Series ;;
  }

  dimension: service_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.ServiceNotes ;;
  }

  dimension_group: shipping_booked {
    group_label:"Dates"
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
    hidden:yes
    sql: ${TABLE}.ShippingBookedNotes ;;
  }

  dimension: shipping_booked_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.ShippingBookedUserId,0) ;;
  }

  dimension_group: shipping_issue {
    group_label:"Dates"
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
    hidden:yes
    sql: ${TABLE}.ShippingIssueNotes ;;
  }

  dimension: shipping_issue_type_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.ShippingIssueTypeId,0) ;;
  }

  dimension: shipping_issue_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.ShippingIssueUserId,0) ;;
  }

  dimension: source_type_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.SourceTypeId,0) ;;
  }

  dimension: sub_source1 {
    type: string
    hidden:yes
    sql: ${TABLE}.SubSource1 ;;
  }

  dimension: sub_source2 {
    type: string
    hidden:yes
    sql: ${TABLE}.SubSource2 ;;
  }

  dimension: supervisor_appraised_amount {
    type: number
    sql: ${TABLE}.SupervisorAppraisedAmount ;;
  }

  dimension_group: supervisor_appraised {
    group_label:"Dates"
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
    sql: ${TABLE}.SupervisorAppraisedDate ;;
  }

  dimension: supervisor_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.SupervisorNotes ;;
  }

  dimension: supervisor_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.SupervisorUserId,0) ;;
  }

  dimension_group: terminated {
    group_label:"Dates"
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
    sql: ${TABLE}.TerminatedDate ;;
  }

  dimension: terminated_user_id {
    type: number
    sql: nvl(${TABLE}.TerminatedUserId,0) ;;
  }

  dimension: termination_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.TerminationNotes ;;
  }

  dimension_group: third_contact {
    group_label:"Dates"
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
    sql: ${TABLE}.ThirdContact ;;
  }

  dimension: tire_condition_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.TireConditionId,0) ;;
  }

  dimension_group: title_in {
    group_label:"Dates"
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
    sql: ${TABLE}.TitleInDate ;;
  }

  dimension: title_in_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.TitleInNotes ;;
  }

  dimension: title_in_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.TitleInUserId,0) ;;
  }

  dimension_group: title_issue {
    group_label:"Dates"
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
    sql: ${TABLE}.TitleIssueDate ;;
  }

  dimension: title_issue_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.TitleIssueNotes ;;
  }

  dimension: title_issue_type_id {
    type: number
    sql: nvl(${TABLE}.TitleIssueTypeId,0) ;;
  }

  dimension: title_issue_user_id {
    type: number
    sql: nvl(${TABLE}.TitleIssueUserId,0) ;;
  }

  dimension_group: title_verified {
    group_label:"Dates"
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
    sql: ${TABLE}.TitleVerifiedDate ;;
  }

  dimension: title_verified_notes {
    type: string
    hidden:yes
    sql: ${TABLE}.TitleVerifiedNotes ;;
  }

  dimension: title_verified_user_id {
    type: number
    hidden:yes
    sql: nvl(${TABLE}.TitleVerifiedUserId,0) ;;
  }

  dimension: is_tmu {
    type: yesno
    sql: nvl2(${TABLE}.TMU,0,1) = 1 ;;
  }

  dimension: is_trade_in {
    type: yesno
    sql: nvl2(${TABLE}.TradeIn,0,1) = 1 ;;
  }

  dimension: is_trike {
    type: yesno
    sql: nvl2(${TABLE}.Trike,0,1) = 1 ;;
  }

  dimension_group: updated {
    group_label:"Dates"
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
    hidden:yes
    sql: nvl(${TABLE}.UpdatedUserId,0) ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.UserId ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.Vin ;;
  }

#   dimension: wire_to_account_name {
#     type: string
#     sql: ${TABLE}.WireToAccountName ;;
#   }
#
#   dimension: wire_to_account_no {
#     type: string
#     sql: ${TABLE}.WireToAccountNo ;;
#   }

#   dimension: wire_to_bank_name {
#     type: string
#     sql: ${TABLE}.WireToBankName ;;
#   }
#
#   dimension: wire_to_routing_no {
#     type: string
#     sql: ${TABLE}.WireToRoutingNo ;;
#   }



# DURATION METRICS
dimension_group: time_between_created_and_submitted{
  type: duration
  hidden: yes
  sql_start: ${created_raw}
  sql_end: isnull(${customer_submitted_raw},${created_raw},
  intervals:[day, hour, minute]
  ;;
}

  dimension_group: time_between_submitted_and_termination{
    type: duration
    hidden: yes
    sql_start: ${customer_submitted_raw}
        sql_end:${terminated_raw}
        intervals:[day, hour, minute]
        ;;
  }



# MEASURES

  measure: count {
    type: count
    drill_fields:[appraisal_drillthrough*]
  }

  measure: appraisals {
    type: count
    drill_fields:[appraisal_drillthrough*]
  }


  measure: total_internet_price {
    type: sum
    sql: ${internet_price} ;;
    value_format_name: usd
    drill_fields:[appraisal_drillthrough*]
  }

  measure: total_nada_clean {
    type: sum
    sql: ${nada_clean_value} ;;
    value_format_name: usd
    drill_fields:[appraisal_drillthrough*]
  }

  measure: total_appraised_amount {
    type: sum
    sql: ${appraised_amount} ;;
    value_format_name: usd
    drill_fields:[appraisal_drillthrough*]
  }

  measure: total_est_freight {
    type: sum
    sql: ${est_freight} ;;
    value_format_name: usd
    drill_fields:[appraisal_drillthrough*]

  }

  measure: sum_of_miles {
    type: sum
    sql: convert(int,case when ${mileage} > 100000 then 100000 else ${mileage} end)*1.0;;
    value_format_name: decimal_0
    drill_fields:[appraisal_drillthrough*]

  }

  measure: average_miles {
#     dcl test
    type: number
    sql: ${sum_of_miles}*1.0/${count}*1.0 ;;
    value_format_name: decimal_0
    drill_fields:[appraisal_drillthrough*]

  }

}
