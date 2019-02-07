view: apr_appraisal {
  sql_table_name: public.rumble_AprAppraisal ;;

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

  dimension: appraisal_id {
    primary_key:yes
    type: number
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: appraisal_offer_id {
    type: number
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
    sql: ${TABLE}.AppraisalStatusId ;;
  }

  dimension: appraised_amount {
    type: number
    sql: ${TABLE}.AppraisedAmount ;;
  }

  dimension_group: appraised {
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
    sql: ${TABLE}.AppraiserNotes ;;
  }

  dimension: appraiser_user_id {
    type: number
    sql: ${TABLE}.AppraiserUserId ;;
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
    sql: ${TABLE}.AssignedToNotes ;;
  }

  dimension: assigned_to_user_id {
    type: number
    sql: ${TABLE}.AssignedToUserId ;;
  }

  dimension: book_data {
    type: string
    hidden: yes
    sql: ${TABLE}.BookData ;;
  }

  dimension_group: book {
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
    sql: ${TABLE}.ClientIPAddress ;;
  }

  dimension: client_user_agent {
    type: string
    hidden: yes
    sql: ${TABLE}.ClientUserAgent ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.Color ;;
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

  dimension: current_step {
    type: string
    sql: ${TABLE}.CurrentStep ;;
  }

  dimension: current_step_no {
    type: number
    sql: ${TABLE}.CurrentStepNo ;;
  }

  dimension_group: customer_contacted {
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
    sql: ${TABLE}.CustomerContactedNotes ;;
  }

  dimension: customer_contacted_user_id {
    type: number
    sql: ${TABLE}.CustomerContactedUserId ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.CustomerId ;;
  }

  dimension: customer_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.CustomerNotes ;;
  }

  dimension_group: customer_notified {
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
    sql: ${TABLE}.CustomerNotifiedUserId ;;
  }

  dimension_group: customer_submitted {
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
    sql: ${TABLE}.DamageDescription ;;
  }

  dimension_group: dead_deal {
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
    sql: ${TABLE}.DeadDealUserId ;;
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
    hidden: yes
    sql: ${TABLE}.DeliveredNotes ;;
  }

  dimension: delivered_user_id {
    type: number
    sql: ${TABLE}.DeliveredUserId ;;
  }

  dimension_group: destination_location {
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
    sql: ${TABLE}.DestinationLocationUserId ;;
  }

  dimension_group: destination_type {
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
    sql: ${TABLE}.DestinationTypeId ;;
  }

  dimension: destination_type_notes {
    type: string
    hidden: yes
    sql: ${TABLE}.DestinationTypeNotes ;;
  }

  dimension: destination_type_user_id {
    type: number
    sql: ${TABLE}.DestinationTypeUserId ;;
  }

  dimension_group: doc_in {
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
    type: string
    sql: ${TABLE}.DocumentSignedBy ;;
  }

  dimension_group: document_upload {
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
    sql: ${TABLE}.DocumentsIssueUserId ;;
  }

  dimension: documents_returned_courier_type_id {
    type: number
    sql: ${TABLE}.DocumentsReturnedCourierTypeId ;;
  }

  dimension_group: documents_returned {
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
    sql: ${TABLE}.DocumentsReturnedUserId ;;
  }

  dimension: documents_sent_courier_type_id {
    type: number
    sql: ${TABLE}.DocumentsSentCourierTypeId ;;
  }

  dimension_group: documents_sent {
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
    sql: ${TABLE}.DocumentsSentTrackingNo ;;
  }

  dimension: documents_sent_user_id {
    type: number
    sql: ${TABLE}.DocumentsSentUserId ;;
  }

  dimension: documents_specialist_user_id {
    type: number
    sql: ${TABLE}.DocumentsSpecialistUserId ;;
  }

  dimension_group: documents_verified {
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
    sql: ${TABLE}.DocumentsVerifiedUserId ;;
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
    type: string
    sql: ${TABLE}.HasBeenOperated ;;
  }

  dimension: has_damage {
    type: string
    sql: ${TABLE}.HasDamage ;;
  }

  dimension: has_photos {
    type: string
    sql: ${TABLE}.HasPhotos ;;
  }

  dimension: have_outstanding_loan {
    type: string
    sql: ${TABLE}.HaveOutstandingLoan ;;
  }

  dimension: internet_price {
    type: number
    sql: ${TABLE}.InternetPrice ;;
  }

  dimension: is_offer_lessthan_owe {
    type: string
    sql: ${TABLE}.IsOfferLessthanOwe ;;
  }

  dimension: is_photo_confirmed {
    type: string
    sql: ${TABLE}.IsPhotoConfirmed ;;
  }

  dimension: is_photo_ready {
    type: string
    sql: ${TABLE}.IsPhotoReady ;;
  }

  dimension: is_photo_rejected {
    type: string
    sql: ${TABLE}.IsPhotoRejected ;;
  }

  dimension: item_guid {
    type: string
    sql: ${TABLE}.ItemGuid ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.ItemName ;;
  }

  dimension: item_type_id {
    type: number
    sql: ${TABLE}.ItemTypeId ;;
  }

  dimension: item_year {
    type: number
    sql: ${TABLE}.ItemYear ;;
  }

  dimension: listing_type_id {
    type: number
    sql: ${TABLE}.ListingTypeId ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.LocationId ;;
  }

  dimension_group: locked {
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
    sql: ${TABLE}.LockedNotes ;;
  }

  dimension: locked_user_id {
    type: number
    sql: ${TABLE}.LockedUserId ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.Make ;;
  }

  dimension: mechanical_condition_id {
    type: number
    sql: ${TABLE}.MechanicalConditionId ;;
  }

  dimension: mileage {
    type: number
    sql: ${TABLE}.Mileage ;;
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
    sql: ${TABLE}.MotorcycleRating ;;
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
    sql: ${TABLE}.OverallConditionId ;;
  }

  dimension: owner2_address1 {
    type: string
    sql: ${TABLE}.Owner2Address1 ;;
  }

  dimension: owner2_address2 {
    type: string
    sql: ${TABLE}.Owner2Address2 ;;
  }

  dimension: owner2_city {
    type: string
    sql: ${TABLE}.Owner2City ;;
  }

  dimension: owner2_country {
    type: string
    sql: ${TABLE}.Owner2Country ;;
  }

  dimension: owner2_email {
    type: string
    sql: ${TABLE}.Owner2Email ;;
  }

  dimension: owner2_home_phone {
    type: string
    sql: ${TABLE}.Owner2HomePhone ;;
  }

  dimension: owner2_legal_name {
    type: string
    sql: ${TABLE}.Owner2LegalName ;;
  }

  dimension: owner2_mobile {
    type: string
    sql: ${TABLE}.Owner2Mobile ;;
  }

  dimension: owner2_office_phone {
    type: string
    sql: ${TABLE}.Owner2OfficePhone ;;
  }

  dimension: owner2_state {
    type: string
    sql: ${TABLE}.Owner2State ;;
  }

  dimension: owner2_zip {
    type: string
    sql: ${TABLE}.Owner2Zip ;;
  }

  dimension: owner_address1 {
    type: string
    sql: ${TABLE}.OwnerAddress1 ;;
  }

  dimension: owner_address2 {
    type: string
    sql: ${TABLE}.OwnerAddress2 ;;
  }

  dimension: owner_city {
    type: string
    sql: ${TABLE}.OwnerCity ;;
  }

  dimension: owner_country {
    type: string
    sql: ${TABLE}.OwnerCountry ;;
  }

  dimension: owner_email {
    type: string
    sql: ${TABLE}.OwnerEmail ;;
  }

  dimension: owner_home_phone {
    type: string
    sql: ${TABLE}.OwnerHomePhone ;;
  }

  dimension: owner_legal_name {
    type: string
    sql: ${TABLE}.OwnerLegalName ;;
  }

  dimension: owner_mobile {
    type: string
    sql: ${TABLE}.OwnerMobile ;;
  }

  dimension: owner_office_phone {
    type: string
    sql: ${TABLE}.OwnerOfficePhone ;;
  }

  dimension: owner_state {
    type: string
    sql: ${TABLE}.OwnerState ;;
  }

  dimension: owner_zip {
    type: string
    sql: ${TABLE}.OwnerZip ;;
  }

  dimension: payment_amount {
    type: number
    sql: ${TABLE}.PaymentAmount ;;
  }

  dimension_group: payment {
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
    sql: ${TABLE}.PaymentIssueNotes ;;
  }

  dimension: payment_issue_type_id {
    type: number
    sql: ${TABLE}.PaymentIssueTypeId ;;
  }

  dimension: payment_issue_user_id {
    type: number
    sql: ${TABLE}.PaymentIssueUserId ;;
  }

  dimension: payment_notes {
    type: string
    sql: ${TABLE}.PaymentNotes ;;
  }

  dimension: payment_type_id {
    type: number
    sql: ${TABLE}.PaymentTypeId ;;
  }

  dimension: payment_user_id {
    type: number
    sql: ${TABLE}.PaymentUserId ;;
  }

  dimension_group: photo_confirmed {
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
    sql: ${TABLE}.PhysicalConditionId ;;
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

  dimension: pickup_address_different {
    type: string
    sql: ${TABLE}.PickupAddressDifferent ;;
  }

  dimension: pickup_city {
    type: string
    sql: ${TABLE}.PickupCity ;;
  }

  dimension: pickup_contact {
    type: string
    sql: ${TABLE}.PickupContact ;;
  }

  dimension: pickup_contact_different {
    type: string
    sql: ${TABLE}.PickupContactDifferent ;;
  }

  dimension: pickup_country {
    type: string
    sql: ${TABLE}.PickupCountry ;;
  }

  dimension: pickup_email {
    type: string
    sql: ${TABLE}.PickupEmail ;;
  }

  dimension: pickup_home_phone {
    type: string
    sql: ${TABLE}.PickupHomePhone ;;
  }

  dimension: pickup_mobile {
    type: string
    sql: ${TABLE}.PickupMobile ;;
  }

  dimension: pickup_office_phone {
    type: string
    sql: ${TABLE}.PickupOfficePhone ;;
  }

  dimension: pickup_state {
    type: string
    sql: ${TABLE}.PickupState ;;
  }

  dimension: pickup_zip {
    type: string
    sql: ${TABLE}.PickupZip ;;
  }

  dimension: promo_code {
    type: string
    sql: ${TABLE}.PromoCode ;;
  }

  dimension_group: receipt_confirmed {
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
    sql: ${TABLE}.ReceiptConfirmedNotes ;;
  }

  dimension: receipt_confirmed_user_id {
    type: number
    sql: ${TABLE}.ReceiptConfirmedUserId ;;
  }

  dimension: reserve_price {
    type: number
    sql: ${TABLE}.ReservePrice ;;
  }

  dimension_group: save_adeal {
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
    sql: ${TABLE}.SaveADealNotes ;;
  }

  dimension: save_adeal_user_id {
    type: number
    sql: ${TABLE}.SaveADealUserId ;;
  }

  dimension_group: second_contact {
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
    sql: ${TABLE}.ServiceNotes ;;
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

  dimension: shipping_issue_type_id {
    type: number
    sql: ${TABLE}.ShippingIssueTypeId ;;
  }

  dimension: shipping_issue_user_id {
    type: number
    sql: ${TABLE}.ShippingIssueUserId ;;
  }

  dimension: source_type_id {
    type: number
    sql: ${TABLE}.SourceTypeId ;;
  }

  dimension: sub_source1 {
    type: string
    sql: ${TABLE}.SubSource1 ;;
  }

  dimension: sub_source2 {
    type: string
    sql: ${TABLE}.SubSource2 ;;
  }

  dimension: supervisor_appraised_amount {
    type: number
    sql: ${TABLE}.SupervisorAppraisedAmount ;;
  }

  dimension_group: supervisor_appraised {
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
    sql: ${TABLE}.SupervisorNotes ;;
  }

  dimension: supervisor_user_id {
    type: number
    sql: ${TABLE}.SupervisorUserId ;;
  }

  dimension_group: terminated {
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
    sql: ${TABLE}.TerminatedUserId ;;
  }

  dimension: termination_notes {
    type: string
    sql: ${TABLE}.TerminationNotes ;;
  }

  dimension_group: third_contact {
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
    sql: ${TABLE}.TireConditionId ;;
  }

  dimension_group: title_in {
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
    sql: ${TABLE}.TitleInNotes ;;
  }

  dimension: title_in_user_id {
    type: number
    sql: ${TABLE}.TitleInUserId ;;
  }

  dimension_group: title_issue {
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
    sql: ${TABLE}.TitleIssueNotes ;;
  }

  dimension: title_issue_type_id {
    type: number
    sql: ${TABLE}.TitleIssueTypeId ;;
  }

  dimension: title_issue_user_id {
    type: number
    sql: ${TABLE}.TitleIssueUserId ;;
  }

  dimension_group: title_verified {
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
    sql: ${TABLE}.TitleVerifiedNotes ;;
  }

  dimension: title_verified_user_id {
    type: number
    sql: ${TABLE}.TitleVerifiedUserId ;;
  }

  dimension: tmu {
    type: string
    sql: ${TABLE}.TMU ;;
  }

  dimension: trade_in {
    type: string
    sql: ${TABLE}.TradeIn ;;
  }

  dimension: trike {
    type: string
    sql: ${TABLE}.Trike ;;
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.UserId ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.Vin ;;
  }

  dimension: wire_to_account_name {
    type: string
    sql: ${TABLE}.WireToAccountName ;;
  }

  dimension: wire_to_account_no {
    type: string
    sql: ${TABLE}.WireToAccountNo ;;
  }

  dimension: wire_to_bank_name {
    type: string
    sql: ${TABLE}.WireToBankName ;;
  }

  dimension: wire_to_routing_no {
    type: string
    sql: ${TABLE}.WireToRoutingNo ;;
  }

  measure: count {
    type: count
    drill_fields: [item_name, owner_legal_name, owner2_legal_name, wire_to_bank_name, wire_to_account_name]
  }

  measure: total_internet_price {
    type: sum
    sql: ${internet_price} ;;
    value_format_name: usd

  }

  measure: total_nada_clean {
    type: sum
    sql: ${nada_clean_value} ;;
    value_format_name: usd

  }

  measure: total_appraised_amount {
    type: sum
    sql: ${appraised_amount} ;;
    value_format_name: usd

  }

  measure: total_est_freight {
    type: sum
    sql: ${est_freight} ;;
    value_format_name: usd

  }

  measure: sum_of_miles {
    type: sum
    sql: convert(int,case when ${mileage} > 100000 then 100000 else ${mileage} end);;
    value_format_name: decimal_0

  }

  measure: average_miles {

    sql: ${sum_of_miles}/${count} ;;
    value_format_name: decimal_0

  }

}
