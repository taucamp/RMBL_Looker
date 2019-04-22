view: org_account {
  sql_table_name: public.rumble_OrgAccount ;;

  dimension: aaid {
    type: string
    sql: ${TABLE}.AAId ;;
  }

  dimension: account_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.AccountId ;;
  }

  dimension: account_image {
    type: string
    sql: ${TABLE}.AccountImage ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.AccountName ;;
  }

  dimension: account_status_id {
    type: number
    sql: ${TABLE}.AccountStatusId ;;
  }

  dimension: account_type_id {
    type: number
    sql: ${TABLE}.AccountTypeId ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.Address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.Address2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.ContactName ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
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

  dimension: dealer_license_img_uri {
    type: string
    sql: ${TABLE}.DealerLicenseImgUri ;;
  }

  dimension: district_manager_id {
    type: number
    sql: ${TABLE}.DistrictManagerId ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension_group: license_exp {
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
    sql: ${TABLE}.LicenseExp ;;
  }

  dimension: license_no {
    type: string
    sql: ${TABLE}.LicenseNo ;;
  }

  dimension: license_state {
    type: location
    sql: ${TABLE}.LicenseState ;;
  }

  dimension: mobile {
    type: string
    sql: ${TABLE}.Mobile ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.ParentId ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }

  dimension: state {
    type: location
    sql: ${TABLE}.state ;;
  }

  dimension: state_sales_tax_img_uri {
    type: string
    sql: ${TABLE}.StateSalesTaxImgUri ;;
  }

  dimension: tax_id {
    type: string
    sql: ${TABLE}.TaxId ;;
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

  dimension: website {
    type: string
    sql: ${TABLE}.Website ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, contact_name]
  }
}
