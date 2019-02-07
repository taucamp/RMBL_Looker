view: adwords_api_keyword_performance {
  sql_table_name: public.adwords_api_keyword_performance ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    type: string
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: app_final_url {
    type: string
    sql: ${TABLE}."app final url" ;;
  }

  dimension: base_ad_group_id {
    type: number
    sql: ${TABLE}."base ad group id" ;;
  }

  dimension: base_campaign_id {
    type: number
    sql: ${TABLE}."base campaign id" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}."client name" ;;
  }

  dimension: conversion_optimizer_bid_type {
    type: string
    sql: ${TABLE}."conversion optimizer bid type" ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: ctr {
    type: string
    sql: ${TABLE}.ctr ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."customer id" ;;
  }

  dimension_group: day {
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
    sql: ${TABLE}.day ;;
  }

  dimension: destination_url {
    type: string
    sql: ${TABLE}."destination url" ;;
  }

  dimension: engagements {
    type: number
    sql: ${TABLE}.engagements ;;
  }

  dimension: final_url {
    type: string
    sql: ${TABLE}."final url" ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.interactions ;;
  }

  dimension: is_negative {
    type: string
    sql: ${TABLE}."is negative" ;;
  }

  dimension: is_restricting {
    type: string
    sql: ${TABLE}."is restricting" ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: keyword_id {
    type: number
    sql: ${TABLE}."keyword id" ;;
  }

  dimension: keyword_state {
    type: string
    sql: ${TABLE}."keyword state" ;;
  }

  dimension: max__cpc {
    type: string
    sql: ${TABLE}."max. cpc" ;;
  }

  dimension: max__cpm {
    type: string
    sql: ${TABLE}."max. cpm" ;;
  }

  dimension: max__cpv {
    type: string
    sql: ${TABLE}."max. cpv" ;;
  }

  dimension: max_cpc_source {
    type: string
    sql: ${TABLE}."max cpc source" ;;
  }

  dimension: max_cpm_source {
    type: string
    sql: ${TABLE}."max cpm source" ;;
  }

  dimension: max_cpv_source {
    type: string
    sql: ${TABLE}."max cpv source" ;;
  }

  dimension: mobile_final_url {
    type: string
    sql: ${TABLE}."mobile final url" ;;
  }

  dimension: reportname {
    type: string
    sql: ${TABLE}.reportname ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}."time zone" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, client_name, reportname]
  }
}
