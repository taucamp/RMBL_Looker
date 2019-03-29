view: pv {
  derived_table: {
    sql: SELECT
      p.anonymous_id as pv_aid,p.event_text as pv_evt, p.received_at as pv_time,
      p.context_page_referrer as pv_ref, p.context_page_url as pv_url, p.context_campaign_source as pv_src,
      regexp_replace(REGEXP_SUBSTR(pv_ref, '[^/]+\\.[^/:]+'), 'www.|.com', '') as Ref ,
      CASE WHEN pv_src IS NULL THEN Ref ELSE pv_src END AS CampaignSrc,
      c.anonymous_id as c_aid,c.event_text as c_evt, c.received_at as c_time, c.appraisal_ref as c_apr
      FROM rumbleon.page_viewed AS p
      JOIN rumbleon.cash_offer_completed AS c ON p.anonymous_id  = c.anonymous_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: pv_aid {
    type: string
    sql: ${TABLE}.pv_aid ;;
  }

  dimension: pv_evt {
    type: string
    sql: ${TABLE}.pv_evt ;;
  }

  dimension_group: pv_time {
    type: time
    sql: ${TABLE}.pv_time ;;
  }

  dimension: pv_ref {
    type: string
    sql: ${TABLE}.pv_ref ;;
  }

  dimension: pv_url {
    type: string
    sql: ${TABLE}.pv_url ;;
  }

  dimension: pv_src {
    type: string
    sql: ${TABLE}.pv_src ;;
  }

  dimension: ref {
    type: string
    sql: ${TABLE}.ref ;;
  }

  dimension: campaignsrc {
    type: string
    sql: ${TABLE}.campaignsrc ;;
  }

  dimension: c_aid {
    type: string
    sql: ${TABLE}.c_aid ;;
  }

  dimension: c_evt {
    type: string
    sql: ${TABLE}.c_evt ;;
  }

  dimension_group: c_time {
    type: time
    sql: ${TABLE}.c_time ;;
  }

  dimension: c_apr {
    type: string
    sql: ${TABLE}.c_apr ;;
  }

  set: detail {
    fields: [
      pv_aid,
      pv_evt,
      pv_time_time,
      pv_ref,
      pv_url,
      pv_src,
      ref,
      campaignsrc,
      c_aid,
      c_evt,
      c_time_time,
      c_apr
    ]
  }
}
