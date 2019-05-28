view: org_user {
  sql_table_name: public.rumble_OrgUser ;;

    dimension: user_id {
    primary_key: yes
    hidden:yes
    type: number
    sql: ${TABLE}.UserId ;;
  }


  dimension: aarep_id {
    type: string
    hidden:yes
    sql: ${TABLE}.AARepId ;;
  }

  dimension_group: aaverified {
    type: time
    hidden:yes
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
    hidden:yes
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
    hidden:yes
    sql: ${TABLE}.Address1 ;;
  }

  dimension: address2 {
    type: string
    hidden:yes
    sql: ${TABLE}.Address2 ;;
  }

  dimension: advent_client_id {
    type: string
    hidden:yes
    sql: ${TABLE}.AdventClientId ;;
  }

  dimension: app_name {
    type: string
    hidden:yes
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
    hidden:yes
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
    hidden:yes
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.DisplayName ;;
  }

  dimension: email {
    type: string
    hidden:yes
    sql: ${TABLE}.Email ;;
  }

  dimension: email2 {
    type: string
    hidden:yes
    sql: ${TABLE}.Email2 ;;
  }

  dimension: email_verified {
    type: yesno
    hidden:yes
    sql: ${TABLE}.EmailVerified <> 0  ;;
  }

  dimension: first_name {
    type: string
    hidden:yes
    sql: ${TABLE}.FirstName ;;
  }

  dimension: home_phone {
    type: string
    hidden:yes
    sql: ${TABLE}.HomePhone ;;
  }

  dimension: hub_spot_vid {
    type: number
    hidden:yes
    value_format_name: id
    sql: ${TABLE}.HubSpotVId ;;
  }

  dimension: is_active {
    type: string
    hidden:yes
    sql: ${TABLE}.IsActive ;;
  }

  dimension: last_name {
    type: string
    hidden:yes
    sql: ${TABLE}.LastName ;;
  }

  dimension: middle_name {
    type: string
    hidden:yes
    sql: ${TABLE}.MiddleName ;;
  }

  dimension: mobile {
    type: string
    hidden:yes
    sql: ${TABLE}.Mobile ;;
  }

  dimension: mobile_verified {
    type: string
    hidden:yes
    sql: ${TABLE}.MobileVerified ;;
  }

  dimension: office_phone {
    type: string
    hidden:yes
    sql: ${TABLE}.OfficePhone ;;
  }

  dimension: optin_marketing_email {
    type: string
    hidden:yes
    sql: ${TABLE}.OptinMarketingEmail ;;
  }

  dimension: password_hash {
    type: string
    hidden:yes
    sql: ${TABLE}.PasswordHash ;;
  }

  dimension: password_salt {
    type: string
    hidden:yes
    sql: ${TABLE}.PasswordSalt ;;
  }

  dimension: source {
    type: string
    hidden:yes
    sql: ${TABLE}.Source ;;
  }

  dimension: state {
    type: string
    hidden:yes
    sql: ${TABLE}.State ;;
  }

  dimension_group: updated {
    type: time
    hidden:yes
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
    sql: ${TABLE}.UpdatedUserId ;;
  }


  dimension: user_image {
    type: string
    hidden:yes
    sql: ${TABLE}.UserImage ;;
  }

  dimension: user_status_id {
    type: number
    hidden:yes
    sql: ${TABLE}.UserStatusId ;;
  }

  dimension: user_type_id {
    type: number
    hidden:no
    sql: ${TABLE}.UserTypeId ;;
  }

  dimension: username {
    type: string
    hidden:no
    sql: ${TABLE}.Username ;;
  }

  dimension: uuid {
    type: string
    hidden:no
    sql: ${TABLE}.Uuid ;;
  }

  dimension: verfication_ref_id {
    type: string
    hidden:no
    sql: ${TABLE}.VerficationRefId ;;
  }

  dimension: zip {
    type: zipcode
    hidden:no
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
