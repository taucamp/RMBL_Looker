view: org_location {
  sql_table_name: public.rumble_OrgLocation ;;

  dimension_group: activated {
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
    sql: ${TABLE}.ActivatedDate ;;
  }

  dimension: activated_user_id {
    type: number
    sql: ${TABLE}.ActivatedUserId ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.Address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.Address2 ;;
  }

  dimension: auto_select {
    type: string
    sql: ${TABLE}.AutoSelect ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.CompanyName ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }

  dimension: is_virtual {
    type: string
    sql: ${TABLE}.IsVirtual ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: location_category_id {
    type: number
    sql: ${TABLE}.LocationCategoryId ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.LocationId ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.LocationName ;;
  }

  dimension: location_type_id {
    type: number
    sql: ${TABLE}.LocationTypeId ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: mobile {
    type: string
    sql: ${TABLE}.Mobile ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
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

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }

  measure: count {
    type: count
    drill_fields: [location_name, company_name, contact_name]
  }
}
