view: facebookads {
  sql_table_name: public."facebook-ads" ;;

  # ----- Sets of fields for drilling ------
  set: facebook_ads_detail {
    fields: [
#       id,
#       account_name,
#       ad_name,
#       adset_name,
#       campaign_name,
#       ads.id,
#       campaigns.id,
#       campaigns.name
    ]
  }

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_goal {
    type: string
    sql: f_sql_mrktg_acct_name_goal(${TABLE}.account_name) ;;
  }

  dimension: account_vehicle_type {
    type: string
    sql: f_sql_mrktg_acct_name_veh_type(${TABLE}.account_name) ;;
  }

  dimension: ad_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: number
    hidden: yes
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    sql: ${TABLE}.adset_name ;;
  }

  dimension: buying_type {
    type: string
    hidden: yes
    sql: ${TABLE}.buying_type ;;
  }

  dimension: call_to_action_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.call_to_action_clicks ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_type {
    type: string
    sql: f_sql_campaign_to_campaign_type(${TABLE}.campaign_name) ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost_per_inline_post_engagement {
    type: number
    hidden: yes
    sql: ${TABLE}.cost_per_inline_post_engagement ;;
  }

  dimension: cost_per_total_action {
    type: number
    hidden: yes
    sql: ${TABLE}.cost_per_total_action ;;
  }

  dimension: cost_per_unique_click {
    type: number
    hidden: yes
    sql: ${TABLE}.cost_per_unique_click ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: cpm {
    type: number
    hidden: yes
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpp {
    type: number
    hidden: yes
    sql: ${TABLE}.cpp ;;
  }

  dimension: ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: ad_date {
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
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
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
    sql: ${TABLE}.date_stop ;;
  }

  dimension: frequency {
    type: number
    hidden: yes
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: inline_link_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_link_clicks ;;
  }

  dimension: inline_post_engagement {
    type: number
    sql: ${TABLE}.inline_post_engagement ;;
  }

  dimension: objective {
    type: string
    hidden: yes
    sql: ${TABLE}.objective ;;
  }

  dimension: reach {
    type: number
    hidden: yes
    sql: ${TABLE}.reach ;;
  }

  dimension: social_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.social_clicks ;;
  }

  dimension: social_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.social_impressions ;;
  }

  dimension: social_reach {
    type: number
    hidden: yes
    sql: ${TABLE}.social_reach ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: total_action_value {
    type: number
    hidden: yes
    sql: ${TABLE}.total_action_value ;;
  }

  dimension: total_actions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_actions ;;
  }

  dimension: total_unique_actions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_unique_actions ;;
  }

  dimension: unique_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_clicks ;;
  }

  dimension: unique_ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_ctr ;;
  }

  dimension: unique_social_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_social_clicks ;;
  }

  measure: count {
    type: count
    drill_fields: [facebook_ads_detail*]
  }

  measure: spend_amount {
    type: sum
    value_format_name: usd_0
    sql: ${spend} ;;
    drill_fields: [facebook_ads_detail*]
  }

  measure: clicks_amount {
    type: sum
    value_format_name: decimal_0
    sql: ${clicks} ;;
    drill_fields: [facebook_ads_detail*]
  }

  measure: impressions_amount {
    type: sum
    value_format_name: decimal_0
    sql: ${impressions} ;;
    drill_fields: [facebook_ads_detail*]
  }

}
