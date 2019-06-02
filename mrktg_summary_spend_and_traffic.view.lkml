view: mrktg_summary_spend_and_traffic {
  derived_table: {
    sql: (( SELECT
    'Adwords' :: TEXT AS platform,
    adp.account_descriptive_name AS account_name,
    f_sql_date_to_first_day_of_week (( adp.date_start ) :: DATE ) AS week,
    f_sql_date_to_first_day_of_month (( adp.date_start ) :: DATE ) AS "month",
    f_sql_mrktg_acct_name_goal ( adp.account_descriptive_name ) AS acct_goal,
    f_sql_mrktg_acct_name_veh_type ( adp.account_descriptive_name ) AS acct_vehicle_type,
    f_sql_campaign_to_campaign_type ( ca.NAME ) AS campaign_type,
    SUM ((
        adp.COST / ( 1000000 ) :: DOUBLE PRECISION
      )) AS spend,
    SUM ( adp.impressions ) AS impressions,
    SUM ( adp.clicks ) AS clicks,
    NULL :: "unknown" AS sessions,
    NULL :: "unknown" AS pageviews,
    NULL :: "unknown" AS bounces,
    NULL :: "unknown" AS organic_searches,
    NULL :: "unknown" AS time_on_page,
    NULL :: "unknown" AS weekly_new_users,
    NULL :: "unknown" AS weekly_users,
    NULL :: "unknown" AS monthly_new_users,
    NULL :: "unknown" AS monthly_users
    FROM
      (((
            adwords.ad_performance_reports adp
            JOIN adwords.ads ad ON (((
                  ad.ID
                  ) :: TEXT = ( adp.ad_id ) :: TEXT
              )))
          JOIN adwords.ad_groups adg ON (((
                adg.ID
                ) :: TEXT = ( ad.ad_group_id ) :: TEXT
            )))
        JOIN adwords.campaigns ca ON (((
              ca.ID
              ) :: TEXT = ( adg.campaign_id ) :: TEXT
          )))
    WHERE
      ((
          adp.date_start
        ) :: DATE >= (( getdate ()) :: DATE - 90 ))
    GROUP BY
      1,
      adp.account_descriptive_name,
      f_sql_date_to_first_day_of_week (( adp.date_start ) :: DATE ),
      f_sql_date_to_first_day_of_month (( adp.date_start ) :: DATE ),
      f_sql_mrktg_acct_name_goal ( adp.account_descriptive_name ),
      f_sql_mrktg_acct_name_veh_type ( adp.account_descriptive_name ),
      f_sql_campaign_to_campaign_type ( ca.NAME ) UNION
    SELECT
      'Bing' :: TEXT AS platform,
      bing_ads.accountname AS account_name,
      f_sql_date_to_first_day_of_week (( bing_ads.timeperiod ) :: DATE ) AS week,
      f_sql_date_to_first_day_of_month (( bing_ads.timeperiod ) :: DATE ) AS "month",
      f_sql_mrktg_acct_name_goal ( bing_ads.accountname ) AS acct_goal,
      f_sql_mrktg_acct_name_veh_type ( bing_ads.accountname ) AS acct_vehicle_type,
      f_sql_campaign_to_campaign_type ( bing_ads.campaignname ) AS campaign_type,
      SUM ( bing_ads.spend ) AS spend,
      SUM ( bing_ads.impressions ) AS impressions,
      SUM ( bing_ads.clicks ) AS clicks,
      NULL :: "unknown" AS sessions,
      NULL :: "unknown" AS pageviews,
      NULL :: "unknown" AS bounces,
      NULL :: "unknown" AS organic_searches,
      NULL :: "unknown" AS time_on_page,
      NULL :: "unknown" AS weekly_new_users,
      NULL :: "unknown" AS weekly_users,
      NULL :: "unknown" AS monthly_new_users,
      NULL :: "unknown" AS monthly_users
    FROM
      bing_ads
    WHERE
      ( bing_ads.timeperiod::DATE  >= (( getdate ()) :: DATE - 90 ))
    GROUP BY
      1,
      bing_ads.accountname,
      f_sql_date_to_first_day_of_week (( bing_ads.timeperiod ) :: DATE ),
      f_sql_date_to_first_day_of_month (( bing_ads.timeperiod ) :: DATE ),
      f_sql_mrktg_acct_name_goal ( bing_ads.accountname ),
      f_sql_mrktg_acct_name_veh_type ( bing_ads.accountname ),
      f_sql_campaign_to_campaign_type ( bing_ads.campaignname )) UNION
  SELECT
    'Facebook' :: TEXT AS platform,
    "facebook-ads".account_name,
    f_sql_date_to_first_day_of_week (( "facebook-ads".date_start ) :: DATE ) AS week,
    f_sql_date_to_first_day_of_month (( "facebook-ads".date_start ) :: DATE ) AS "month",
    f_sql_mrktg_acct_name_goal ( "facebook-ads".account_name ) AS acct_goal,
    f_sql_mrktg_acct_name_veh_type ( "facebook-ads".account_name ) AS acct_vehicle_type,
    f_sql_campaign_to_campaign_type ( "facebook-ads".campaign_name ) AS campaign_type,
    SUM ( "facebook-ads".spend ) AS spend,
    SUM ( "facebook-ads".impressions ) AS impressions,
    SUM ( "facebook-ads".clicks ) AS clicks,
    NULL :: "unknown" AS sessions,
    NULL :: "unknown" AS pageviews,
    NULL :: "unknown" AS bounces,
    NULL :: "unknown" AS organic_searches,
    NULL :: "unknown" AS time_on_page,
    NULL :: "unknown" AS weekly_new_users,
    NULL :: "unknown" AS weekly_users,
    NULL :: "unknown" AS monthly_new_users,
    NULL :: "unknown" AS monthly_users
  FROM
    "facebook-ads"
  WHERE
    ( "facebook-ads".date_start::DATE >= (( getdate ()) :: DATE - 90 ) )
  GROUP BY
    1,
    "facebook-ads".account_name,
    f_sql_date_to_first_day_of_week (( "facebook-ads".date_start ) :: DATE ),
    f_sql_date_to_first_day_of_month (( "facebook-ads".date_start ) :: DATE ),
    f_sql_mrktg_acct_name_goal ( "facebook-ads".account_name ),
    f_sql_mrktg_acct_name_veh_type ( "facebook-ads".account_name ),
  f_sql_campaign_to_campaign_type ( "facebook-ads".campaign_name )) UNION
SELECT
  'Google Analytics' AS platform,
  'GA - Stitch & Panoply' AS account_name,
  f_sql_date_to_first_day_of_week (( rpt.DATE ) :: DATE ) AS week,
  f_sql_date_to_first_day_of_month (( rpt.DATE ) :: DATE ) AS "month",
  'Unknown' AS acct_goal,
  'Unknown' AS acct_vehicle_type,
  f_sql_campaign_to_campaign_type (
  COALESCE ( rpt.campaign, 'Unknown' :: CHARACTER VARYING )) AS campaign_type,
  NULL :: "unknown" AS spend,
  NULL :: "unknown" AS impressions,
  NULL :: "unknown" AS clicks,
  SUM ( rpt.sessions ) AS sessions,
  SUM ( rpt.pageviews ) AS pageviews,
  SUM ( rpt.bounces ) AS bounces,
  SUM ( rpt.organicsearches ) AS organic_searches,
  SUM ( rpt.timeonpage ) AS time_on_page,
  AVG ( gaw.newusers ) AS weekly_new_users,
  AVG ( gaw.users ) AS weekly_users,
  AVG ( gam.newusers ) AS monthly_new_users,
  AVG ( gam.users ) AS monthly_users
FROM
  ((
      stitch_google_analytics.report rpt
      LEFT JOIN google_analytics_users_weekly gaw ON ((
        f_sql_date_to_first_day_of_week (( rpt.DATE ) :: DATE ) = f_sql_yearweek_to_date ( gaw.yearweek ))))
    LEFT JOIN google_analytics_users_monthly gam ON ((
      f_sql_date_to_first_day_of_month (( rpt.DATE ) :: DATE ) = f_sql_yearmonth_to_date ( gam.yearmonth ))))
    WHERE ( rpt.DATE ) :: DATE  >= (( getdate ()) :: DATE - 90 )
GROUP BY
  f_sql_campaign_to_campaign_type ( rpt.campaign ),
  f_sql_date_to_first_day_of_week (( rpt.DATE ) :: DATE ),
  f_sql_date_to_first_day_of_month (( rpt.DATE ) :: DATE ),
  f_sql_campaign_to_campaign_type (
  COALESCE ( rpt.campaign, 'Unknown' :: CHARACTER VARYING ))


                ;;

      datagroup_trigger: financial_datagroup
      distribution_style: all

    }

  dimension: Platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension_group: week {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.week ;;
  }

  dimension_group: month {

    sql: ${TABLE}.month ;;
  }

  dimension: account_goal {
    type: string
    sql: ${TABLE}.account_goal ;;
  }

  dimension: acct_vehicle_type {
    type: string
    sql: ${TABLE}.acct_vehicle_type ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.spend ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.impressions ;;
  }
  dimension: clicks {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.clicks ;;
  }
  dimension: sessions {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.sessions ;;
  }
  dimension: pageviews {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.pageviews ;;
  }
  dimension: bounces {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.bounces ;;
  }
  dimension: organic_searches {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.organic_searches ;;
  }
  dimension: time_on_page {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.time_on_page ;;
  }
  dimension: weekly_new_users {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.weekly_new_users ;;
  }
  dimension: weekly_users {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.weekly_users ;;
  }
  dimension: monthly_new_users {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.monthly_new_users ;;
  }
  dimension: monthly_users {
    type: number
    hidden: yes
    value_format_name: decimal_0
    sql: ${TABLE}.monthly_users ;;
  }

  measure: total_spend {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.spend ;;
  }

  measure: total_impressions {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.impressions ;;
  }
  measure: total_clicks {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.clicks ;;
  }
  measure: total_sessions {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.sessions ;;
  }
  measure: total_pageviews {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.pageviews ;;
  }
  measure: total_bounces {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.bounces ;;
  }
  measure: total_organic_searches {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.organic_searches ;;
  }
  measure: total_time_on_page {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.time_on_page ;;
  }
  measure: total_weekly_new_users {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.weekly_new_users ;;
  }
  measure: total_weekly_users {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.weekly_users ;;
  }
  measure: total_monthly_new_users {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.monthly_new_users ;;
  }
  measure: total_monthly_users {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.monthly_users ;;
  }



}
