view: bing_ads {
  sql_table_name: public.bing_ads ;;

# ----- Sets of fields for drilling ------
  set: bing_ads_detail {
    fields: [
      id,
      final_url
#       adgroupname,
#       campaignname,
#       accountname,
#       campaigns.id,
#       campaigns.name,
#       ads.id
    ]
  }

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: __id {
    type: string
    hidden: yes
    sql: ${TABLE}.__id ;;
  }

  dimension: __report {
    type: string
    hidden: yes
    sql: ${TABLE}.__report ;;
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

  dimension: __state {
    type: string
    hidden: yes
    sql: ${TABLE}.__state ;;
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

  dimension: accountid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.accountid ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.accountname ;;
  }

  dimension: accountnumber {
    type: string
    sql: ${TABLE}.accountnumber ;;
  }

  dimension: accountstatus {
    type: string
    hidden: yes
    sql: ${TABLE}.accountstatus ;;
  }

  dimension: addescription {
    type: string
    hidden: yes
    sql: ${TABLE}.addescription ;;
  }

  dimension: addistribution {
    type: string
    hidden: yes
    sql: ${TABLE}.addistribution ;;
  }

  dimension: adgroupid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.adgroupid ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.adgroupname ;;
  }

  dimension: adgroupstatus {
    type: string
    hidden: yes
    sql: ${TABLE}.adgroupstatus ;;
  }

  dimension: adid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.adid ;;
  }

  dimension: adstatus {
    type: string
    sql: ${TABLE}.adstatus ;;
  }

  dimension: adtype {
    type: string
    hidden: yes
    sql: ${TABLE}.adtype ;;
  }

  dimension: assists {
    type: number
    hidden: yes
    sql: ${TABLE}.assists ;;
  }

  dimension: averagecpc {
    type: number
    hidden: yes
    sql: ${TABLE}.averagecpc ;;
  }

  dimension: averageposition {
    type: number
    hidden: yes
    sql: ${TABLE}.averageposition ;;
  }

  dimension: bidmatchtype {
    type: string
    hidden: yes
    sql: ${TABLE}.bidmatchtype ;;
  }

  dimension: campaignid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.campaignid ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaignname ;;
  }

  dimension: campaign_type {
    type: string
    sql: f_sql_campaign_to_campaign_type(${TABLE}.campaignname) ;;
  }

  dimension: campaignstatus {
    type: string
    hidden: yes
    sql: ${TABLE}.campaignstatus ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversionrate {
    type: string
    hidden: yes
    sql: ${TABLE}.conversionrate ;;
  }

  dimension: conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.conversions ;;
  }

  dimension: costperassist {
    type: number
    hidden: yes
    sql: ${TABLE}.costperassist ;;
  }

  dimension: costperconversion {
    type: number
    hidden: yes
    sql: ${TABLE}.costperconversion ;;
  }

  dimension: ctr {
    type: string
    hidden: yes
    sql: ${TABLE}.ctr ;;
  }

  dimension: currencycode {
    type: string
    hidden: yes
    sql: ${TABLE}.currencycode ;;
  }

  dimension: delivered_match_type {
    type: string
    hidden: yes
    sql: ${TABLE}.deliveredmatchtype ;;
  }

  dimension: device_os {
    type: string
   sql: ${TABLE}.deviceos ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: displayurl {
    type: string
    hidden: yes
    sql: ${TABLE}.displayurl ;;
  }

  dimension: final_url {
    type: string
    hidden: yes
    sql: ${TABLE}.finalurl ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: language {
    type: string
    hidden: yes
    sql: ${TABLE}.language ;;
  }

  dimension: network {
    type: string
    hidden: yes
    sql: ${TABLE}.network ;;
  }

  dimension: path1 {
    type: string
    hidden: yes
    sql: ${TABLE}.path1 ;;
  }

  dimension: path2 {
    type: string
    hidden: yes
    sql: ${TABLE}.path2 ;;
  }

  dimension: returnonadspend {
    type: number
    hidden: yes
    sql: ${TABLE}.returnonadspend ;;
  }

  dimension: revenue {
    type: string
    hidden: yes
    sql: ${TABLE}.revenue ;;
  }

  dimension: revenueperassist {
    type: number
    hidden: yes
    sql: ${TABLE}.revenueperassist ;;
  }

  dimension: revenueperconversion {
    type: number
    hidden: yes
    sql: ${TABLE}.revenueperconversion ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
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
    sql: ${TABLE}.timeperiod ;;
  }

  dimension: titlepart1 {
    type: string
    hidden: yes
    sql: ${TABLE}.titlepart1 ;;
  }

  dimension: titlepart2 {
    type: string
    hidden: yes
    sql: ${TABLE}.titlepart2 ;;
  }

  dimension: topvsother {
    type: string
    hidden: yes
    sql: ${TABLE}.topvsother ;;
  }

  dimension: trackingtemplate {
    type: string
    hidden: yes
    sql: ${TABLE}.trackingtemplate ;;
  }

  measure: count {
    type: count
    drill_fields: [bing_ads_detail*]
  }

  measure: spend_amount {
    type: sum
    value_format_name: usd_0
    sql: ${spend} ;;
    drill_fields: [bing_ads_detail*]
  }

  measure: clicks_amount {
    type: sum
    value_format_name: decimal_0
    sql: ${clicks} ;;
    drill_fields: [bing_ads_detail*]
  }

  measure: impressions_amount {
    type: sum
    value_format_name: decimal_0
    sql: ${impressions} ;;
    drill_fields: [bing_ads_detail*]
  }

}
