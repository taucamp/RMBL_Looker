view: org_user {
  sql_table_name: public.rumble_OrgUser ;;

  dimension: aarep_id {
    hidden:yes
    type: string
    sql: ${TABLE}.AARepId ;;
  }

  dimension_group: aaverified {
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
    sql: ${TABLE}.AAVerifiedDate ;;
  }

  dimension_group: active_after {
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
    sql: ${TABLE}.ActiveAfterDate ;;
  }

  dimension: address1 {
    hidden:yes
    type: string
    sql: ${TABLE}.Address1 ;;
  }

  dimension: address2 {
    hidden:yes
    type: string
    sql: ${TABLE}.Address2 ;;
  }

  dimension: advent_client_id {
    hidden:yes
    type: string
    sql: ${TABLE}.AdventClientId ;;
  }

  dimension: app_name {
    hidden:yes
    type: string
    sql: ${TABLE}.AppName ;;
  }

  dimension: city {
    hidden:yes
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: company_name {
    hidden:yes
    type: string
    sql: ${TABLE}.CompanyName ;;
  }

  dimension: country {
    hidden:yes
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension: created_user_id {
    hidden:yes
    type: number
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: display_name {
    hidden:no
    type: string
    sql: ${TABLE}.DisplayName ;;
  }

  dimension: email {
    hidden:yes
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: email2 {
    hidden:yes
    type: string
    sql: ${TABLE}.Email2 ;;
  }

  dimension: email_verified {
    hidden:yes
    type: yesno
    sql: ${TABLE}.EmailVerified <> 0  ;;
  }

  dimension: first_name {
    hidden:yes
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: home_phone {
    hidden:yes
    type: string
    sql: ${TABLE}.HomePhone ;;
  }

  dimension: hub_spot_vid {
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.HubSpotVId ;;
  }

  dimension: is_active {
    hidden:yes
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  dimension: last_name {
    hidden:yes
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: middle_name {
    hidden:yes
    type: string
    sql: ${TABLE}.MiddleName ;;
  }

  dimension: mobile {
    hidden:yes
    type: string
    sql: ${TABLE}.Mobile ;;
  }

  dimension: mobile_verified {
    hidden:yes
    type: string
    sql: ${TABLE}.MobileVerified ;;
  }

  dimension: office_phone {
    hidden:yes
    type: string
    sql: ${TABLE}.OfficePhone ;;
  }

  dimension: optin_marketing_email {
    hidden:yes
    type: string
    sql: ${TABLE}.OptinMarketingEmail ;;
  }

  dimension: password_hash {
    hidden:yes
    type: string
    sql: ${TABLE}.PasswordHash ;;
  }

  dimension: password_salt {
    hidden:yes
    type: string
    sql: ${TABLE}.PasswordSalt ;;
  }

  dimension: source {
    hidden:yes
    type: string
    sql: ${TABLE}.Source ;;
  }

  dimension: state {
    hidden:no
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.UpdatedDate ;;
  }

  dimension: updated_user_id {
    hidden:yes
    type: number
    sql: ${TABLE}.UpdatedUserId ;;
  }

  dimension: user_id {
    primary_key: yes
    hidden:yes
    type: number
    sql: ${TABLE}.UserId ;;
  }

  dimension: user_image {
    hidden:yes
    type: string
    sql: ${TABLE}.UserImage ;;
  }

  dimension: user_status_id {
    type: number
    sql: ${TABLE}.UserStatusId ;;
  }

  dimension: user_type_id {
    hidden:yes
    type: number
    sql: ${TABLE}.UserTypeId ;;
  }

  dimension: username {
    hidden:yes
    type: string
    sql: ${TABLE}.Username ;;
  }

  dimension: uuid {
    hidden:yes
    type: string
    sql: ${TABLE}.Uuid ;;
  }

  dimension: verfication_ref_id {
    hidden:yes
    type: string
    sql: ${TABLE}.VerficationRefId ;;
  }

  dimension: zip {
    hidden:no
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
