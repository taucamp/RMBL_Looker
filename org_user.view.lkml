view: org_user {
  sql_table_name: public.rumble_OrgUser ;;

  dimension: aarep_id {
    type: string
    sql: ${TABLE}.AARepId ;;
  }

  dimension_group: aaverified {
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
    sql: ${TABLE}.AAVerifiedDate ;;
  }

  dimension_group: active_after {
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
    sql: ${TABLE}.ActiveAfterDate ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.Address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.Address2 ;;
  }

  dimension: advent_client_id {
    type: string
    sql: ${TABLE}.AdventClientId ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.AppName ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.CompanyName ;;
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

  dimension: display_name {
    type: string
    sql: ${TABLE}.DisplayName ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: email2 {
    type: string
    sql: ${TABLE}.Email2 ;;
  }

  dimension: email_verified {
    type: string
    sql: ${TABLE}.EmailVerified ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: home_phone {
    type: string
    sql: ${TABLE}.HomePhone ;;
  }

  dimension: hub_spot_vid {
    type: number
    value_format_name: id
    sql: ${TABLE}.HubSpotVId ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.MiddleName ;;
  }

  dimension: mobile {
    type: string
    sql: ${TABLE}.Mobile ;;
  }

  dimension: mobile_verified {
    type: string
    sql: ${TABLE}.MobileVerified ;;
  }

  dimension: office_phone {
    type: string
    sql: ${TABLE}.OfficePhone ;;
  }

  dimension: optin_marketing_email {
    type: string
    sql: ${TABLE}.OptinMarketingEmail ;;
  }

  dimension: password_hash {
    type: string
    sql: ${TABLE}.PasswordHash ;;
  }

  dimension: password_salt {
    type: string
    sql: ${TABLE}.PasswordSalt ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.Source ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
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
    primary_key: yes
    type: number
    sql: ${TABLE}.UserId ;;
  }

  dimension: user_image {
    type: string
    sql: ${TABLE}.UserImage ;;
  }

  dimension: user_status_id {
    type: number
    sql: ${TABLE}.UserStatusId ;;
  }

  dimension: user_type_id {
    type: number
    sql: ${TABLE}.UserTypeId ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.Username ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.Uuid ;;
  }

  dimension: verfication_ref_id {
    type: string
    sql: ${TABLE}.VerficationRefId ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      username,
      display_name,
      first_name,
      last_name,
      middle_name,
      company_name,
      app_name
    ]
  }
}
