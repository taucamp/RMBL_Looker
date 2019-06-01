view: ad_groups {
  sql_table_name: adwords.ad_groups ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: adwords_customer_id {
    type: string
    hidden: yes
    sql: ${TABLE}.adwords_customer_id ;;
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: name {
    type: string
    label: "Ad Group Name"
    sql: ${TABLE}.name ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: status {
    type: string
    hidden:yes
    sql: ${TABLE}.status ;;
  }

  dimension: uuid {
    type: number
    hidden:yes
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    type: count
    hidden:yes
    drill_fields: [id, name, campaigns.id, campaigns.name, ads.count]
  }
}
