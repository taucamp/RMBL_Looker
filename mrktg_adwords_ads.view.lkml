view: mrktg_adwords_ads {
  sql_table_name: adwords.ads ;;

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      ad_type,
      final_urls,
      mrktg_ad_groups.id,
      mrktg_ad_groups.name,
      mrktg_ad_performance_reports.count,
      mrktg_bing_ads.count,
      mrktg_facebook_ads.count
    ]
  }


  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: ad_group_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: adwords_customer_id {
    type: string
    hidden: yes
    sql: ${TABLE}.adwords_customer_id ;;
  }

  dimension: final_urls {
    type: string
    hidden: yes
    sql: ${TABLE}.final_urls ;;
  }

  dimension: original_id {
    type: string
    hidden: yes
    sql: ${TABLE}.original_id ;;
  }

  dimension_group: received {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  dimension: status {
    type: string
    hidden: yes
    sql: ${TABLE}.status ;;
  }

  dimension: ad_type {
    label: "Ad Type, e.g. Image, Expanded Text, Responsive Display, etc"
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uuid {
    type: number
    hidden:  yes
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
    type: time
    hidden:  yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


}
