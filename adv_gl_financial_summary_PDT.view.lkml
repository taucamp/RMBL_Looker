view: adv_gl_financial_summary_pdt {

  derived_table: {persist_for: "24 hours"
    sql: SELECT
  nvl(acct_chart_of_accounts.majorgroup_rank,99)  AS "major_group_rank",
  nvl(acct_chart_of_accounts.majorgroup,'Unkown') AS "major_group",
  nvl(acct_chart_of_accounts.minorgroup_rank,99)  AS "minor_group_rank",
  nvl(acct_chart_of_accounts.minorgroup,'Unkown') AS "minor_group",
  nvl(acct_chart_of_accounts.detailgroup_rank,99) AS detail_group_rank,
  nvl(acct_chart_of_accounts.detailgroup,'Unkown') AS detail_group,
  Advent_GL_detail.accountnumber,
  Advent_Chart_of_Accounts.accounttitle,
  f_sql_adv_acct_to_division(Advent_GL_detail.accountnumber) as "division",
  nvl(div.division_name,'UNKNOWN') as Division_Name,
  nvl(div.division_rank,99) as Division_rank,
  f_sql_adv_acct_to_location(Advent_GL_detail.accountnumber) as "location",
  nvl(loc.location_name, 'Unknown') as location_name,
  nvl(loc.location_rank,99) as location_rank,
  f_sql_adv_acct_to_department(Advent_GL_detail.accountnumber) as "department",
  nvl(dept.department_name,'Unknown') as department_name,
  nvl(dept.department_rank,99) as department_rank,
  nvl(acct_chart_of_accounts.accountnumber,'9999')  AS "account",
  nvl(acct_chart_of_accounts.account,'Unknown')  AS "account_name",
  nvl(typical_balance,'Unknown') as typical_balance,
  nvl(financials_multiplier,1) as financials_multiplier,
  date_part(y,a.lastdayofmonth) as "accounting_year",
  a.lastdayofmonth as "accounting_month",
   is_bal_sheet_acct,
  SUM(CASE WHEN last_day(Advent_GL_detail.accounting_date::date) = a.lastdayofmonth and Advent_GL_detail.amount >= 0 THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "period_debit_amount",
  SUM(CASE WHEN last_day(Advent_GL_detail.accounting_date::date) = a.lastdayofmonth and Advent_GL_detail.amount < 0 THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "period_credit_amount",
  SUM(CASE WHEN last_day(Advent_GL_detail.accounting_date::date) = a.lastdayofmonth THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "period_amount",
  SUM(CASE WHEN last_day(Advent_GL_detail.accounting_date::date) = a.lastdayofmonth  THEN Advent_GL_detail.amount*1 ELSE 0 END )::decimal(19,2) * financials_multiplier as "period_amount_fin"
--  SUM(CASE WHEN Advent_GL_detail.accounting_date::date between date_trunc('year',a.lastdayofmonth::date)::date  and a.lastdayofmonth::date THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "ytd_amount"
--   SUM(CASE WHEN date_part(y,Advent_GL_detail.accounting_date::date) = date_part(y,a.lastdayofmonth) AND  last_day(Advent_GL_detail.accounting_date::date) <= a.lastdayofmonth::date THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) * financials_multiplier as "ytd_amount_fin"
FROM
  (select distinct lastdayofmonth from ref_dimdate where firstdayofmonth1 > '2017-12-31') a
JOIN public.adv_gl_detail  AS Advent_GL_detail ON a.lastdayofmonth::date = last_day(Advent_GL_detail.accounting_date::date)
LEFT JOIN public.adv_gl_chart  AS Advent_Chart_of_Accounts ON Advent_Chart_of_Accounts.accountnumber=Advent_GL_detail.accountnumber
LEFT JOIN tomtest.chartofaccounts  AS acct_chart_of_accounts ON acct_chart_of_accounts.accountnumber=split_part(Advent_Chart_of_Accounts.accountnumber,'.',1)
LEFT JOIN tomtest.acct_division as Div on f_sql_adv_acct_to_division(Advent_GL_detail.accountnumber) = div.division_id
LEFT JOIN tomtest.acct_locations as Loc on f_sql_adv_acct_to_location(Advent_GL_detail.accountnumber) = loc.location_id
LEFT JOIN tomtest.acct_department as Dept on f_sql_adv_acct_to_department(Advent_GL_detail.accountnumber) = dept.department_id

-- WHERE (document_info <> 'AUTOMATIC BALFWD' and control <> 'NOT APPLICABLE')
-- WHERE red_dimdate.firstdayofmonth1 > '2017-12-31'
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24

UNION ALL

SELECT
  nvl(acct_chart_of_accounts.majorgroup_rank,99)  AS "major_group_rank",
  nvl(acct_chart_of_accounts.majorgroup,'Unkown') AS "major_group",
  nvl(acct_chart_of_accounts.minorgroup_rank,99)  AS "minor_group_rank",
  nvl(acct_chart_of_accounts.minorgroup,'Unkown') AS "minor_group",
  nvl(acct_chart_of_accounts.detailgroup_rank,99) AS detail_group_rank,
  nvl(acct_chart_of_accounts.detailgroup,'Unkown') AS detail_group,
  Advent_GL_detail.accountnumber,
  Advent_Chart_of_Accounts.accounttitle,
  f_sql_adv_acct_to_division(Advent_GL_detail.accountnumber) as "division",
  nvl(div.division_name,'UNKNOWN') as Division_Name,
  nvl(div.division_rank,99) as Division_rank,
  f_sql_adv_acct_to_location(Advent_GL_detail.accountnumber) as "location",
  nvl(loc.location_name, 'Unknown') as location_name,
  nvl(loc.location_rank,99) as location_rank,
  f_sql_adv_acct_to_department(Advent_GL_detail.accountnumber) as "department",
  nvl(dept.department_name,'Unknown') as department_name,
  nvl(dept.department_rank,99) as department_rank,
  nvl(acct_chart_of_accounts.accountnumber,'9999')  AS "account",
  nvl(acct_chart_of_accounts.account,'Unknown')  AS "account_name",
  nvl(typical_balance,'Unknown') as typical_balance,
  nvl(financials_multiplier,1) as financials_multiplier,
  date_part(y,a.lastdayofmonth) as "accounting_year",
  a.lastdayofmonth as "accounting_month",
   is_bal_sheet_acct,
  SUM(CASE WHEN last_day(Advent_GL_detail.accounting_date::date) = a.lastdayofmonth and Advent_GL_detail.amount >= 0 THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "period_debit_amount",
  SUM(CASE WHEN last_day(Advent_GL_detail.accounting_date::date) = a.lastdayofmonth and Advent_GL_detail.amount < 0 THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "period_credit_amount",
  SUM(CASE WHEN last_day(Advent_GL_detail.accounting_date::date) = a.lastdayofmonth THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "period_amount",
  SUM(CASE WHEN last_day(Advent_GL_detail.accounting_date::date) = a.lastdayofmonth  THEN Advent_GL_detail.amount*1 ELSE 0 END )::decimal(19,2) * financials_multiplier as "period_amount_fin"
--  SUM(CASE WHEN Advent_GL_detail.accounting_date::date between date_trunc('year',a.lastdayofmonth::date)::date  and a.lastdayofmonth::date THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "ytd_amount"
--   SUM(CASE WHEN date_part(y,Advent_GL_detail.accounting_date::date) = date_part(y,a.lastdayofmonth) AND  last_day(Advent_GL_detail.accounting_date::date) <= a.lastdayofmonth::date THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) * financials_multiplier as "ytd_amount_fin"
FROM
  (select distinct lastdayofmonth from ref_dimdate where firstdayofmonth1 > '2017-12-31') a
JOIN public.adv_gl_detail_2018  AS Advent_GL_detail ON a.lastdayofmonth::date = last_day(Advent_GL_detail.accounting_date::date)
LEFT JOIN public.adv_gl_chart  AS Advent_Chart_of_Accounts ON Advent_Chart_of_Accounts.accountnumber=Advent_GL_detail.accountnumber
LEFT JOIN tomtest.chartofaccounts  AS acct_chart_of_accounts ON acct_chart_of_accounts.accountnumber=split_part(Advent_Chart_of_Accounts.accountnumber,'.',1)
LEFT JOIN tomtest.acct_division as Div on f_sql_adv_acct_to_division(Advent_GL_detail.accountnumber) = div.division_id
LEFT JOIN tomtest.acct_locations as Loc on f_sql_adv_acct_to_location(Advent_GL_detail.accountnumber) = loc.location_id
LEFT JOIN tomtest.acct_department as Dept on f_sql_adv_acct_to_department(Advent_GL_detail.accountnumber) = dept.department_id

-- WHERE (document_info <> 'AUTOMATIC BALFWD' and control <> 'NOT APPLICABLE')
-- WHERE red_dimdate.firstdayofmonth1 > '2017-12-31'
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24


    ;;

    datagroup_trigger: financial_datagroup
    distribution_style: all

  }


  dimension: major_group {
    type: string
    sql: ${TABLE}.major_group ;;
    order_by_field: major_group_rank_pdt
  }

  dimension: major_group_rank_pdt {
    hidden: no
    type: number
    sql: ${TABLE}.major_group_rank ;;
  }

  dimension: minor_group {
    type: string
    sql: ${TABLE}.minor_group ;;
    order_by_field: minor_group_rank_pdt

  }

  dimension: minor_group_rank_pdt {
    hidden: no
    type: number
    sql: ${TABLE}.minor_group_rank ;;
  }

  dimension: detail_group {
    type: string
    sql: ${TABLE}.detail_group ;;
    order_by_field: detail_group_rank_pdt

  }

  dimension: detail_group_rank_pdt {
    hidden: no
    type: number
    sql: ${TABLE}.detail_group_rank ;;
  }




  dimension: full_account_number {
    type: string
    sql: ${TABLE}.accountnumber ;;
  }

  dimension: full_account_title {
    type: string
    sql: ${TABLE}.accounttitle ;;
  }

  dimension: full_account_num_and_title {
    type: string
    sql: ${TABLE}.accountnumber + ' - ' +${TABLE}.accounttitle ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: division_name {
    type: string
    order_by_field: division_rank
    sql: ${TABLE}.division_name ;;
  }

  dimension: division_rank {
    type: number
    sql: ${TABLE}.division_rank ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: location_name {
    type: string
    order_by_field: location_rank
    sql: ${TABLE}.location_name ;;
  }

  dimension: location_rank {
    type: number
    sql: ${TABLE}.location ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: department_name {
    type: string
    order_by_field: department_rank
    sql: ${TABLE}.department_name ;;
  }

  dimension: department_rank {
    type: number
    sql: ${TABLE}.department_rank ;;
  }

  dimension: account_first_segment {
    type: number
    sql: ${TABLE}.account ;;
  }

  dimension: account_name {
    type: string
    order_by_field: account_first_segment
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_and_desc {
    type: string
    order_by_field: account_first_segment
    sql: ${account_first_segment}+' - '+account_name ;;
  }


  dimension: typical_balance {
    type: string
    sql: ${TABLE}.typical_balance ;;
  }

  dimension: financials_multiplier {
    type: number
    sql: ${TABLE}.financials_multiplier ;;
  }

  dimension_group: accounting_month {
    type: time
    hidden: no
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.accounting_month ;;
  }

  dimension_group: accounting_year   {
    type: time
    hidden: no
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.accounting_year ;;
  }
  dimension: is_balance_sheet_acct {
    type: string
    sql: ${TABLE}.is_bal_sheet_acct ;;
  }

  dimension: period_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.period_amount ;;
  }

  # dimension: life_to_date_amount {
  #   type: number
  #   value_format_name: usd
  #   sql: ${TABLE}.ltd_amount ;;
  # }

  measure: total_period_amount {
    type: sum
    value_format_name: usd
    sql: ${period_amount} ;;
  }

  # measure:LTD_Amount {
  #   type: sum
  #   value_format_name: usd
  #   sql: ${life_to_date_amount} ;;
  # }

  measure: total_period_amount_fin {
    type: sum
    value_format_name: usd
    sql: ${period_amount}*${financials_multiplier} ;;
  }

  # measure:LTD_Amount_fin {
  #   type: sum
  #   value_format_name: usd
  #   sql: ${life_to_date_amount}*${financials_multiplier} ;;
  # }

}
