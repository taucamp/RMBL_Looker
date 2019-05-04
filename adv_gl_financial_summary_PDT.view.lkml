view: adv_gl_financial_summary_pdt {

  derived_table: {
    sql: SELECT
  acct_chart_of_accounts.majorgroup_rank  AS "major_group_rank",
  acct_chart_of_accounts.majorgroup AS "major_group",
  acct_chart_of_accounts.minorgroup_rank  AS "minor_group_rank",
  acct_chart_of_accounts.minorgroup AS "minor_group",
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
  acct_chart_of_accounts.accountnumber  AS "account",
  acct_chart_of_accounts.account  AS "account_name",
  typical_balance,
  financials_multiplier,
  a.firstdayofmonth1 as "accounting_month",
  --f_sql_date_to_first_day_of_month(Advent_GL_detail.accounting_date) AS "advent_gl_detail.accounting_date_month_1",
  is_bal_sheet_acct,
  SUM(CASE WHEN f_sql_date_to_first_day_of_month(Advent_GL_detail.accounting_date::date) = a.firstdayofmonth1 THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "period_amount",
  SUM(CASE WHEN f_sql_date_to_first_day_of_month(Advent_GL_detail.accounting_date::date) = a.firstdayofmonth1 THEN Advent_GL_detail.amount*1 ELSE 0 END )::decimal(19,2) * financials_multiplier as "period_amount_fin",
  SUM(Advent_GL_detail.amount*1)::decimal(19,2) as "ltd_amount",
  SUM(Advent_GL_detail.amount*1)::decimal(19,2) * financials_multiplier as "ltd_amount_fin"
FROM
  (select distinct firstdayofmonth1 from ref_dimdate where firstdayofmonth1 > '2017-12-31') a
LEFT JOIN public.adv_gldetail  AS Advent_GL_detail ON a.firstdayofmonth1 >= f_sql_date_to_first_day_of_month(Advent_GL_detail.accounting_date::date)
LEFT JOIN public.adv_glchart  AS Advent_Chart_of_Accounts ON Advent_Chart_of_Accounts.accountnumber=Advent_GL_detail.accountnumber
LEFT JOIN tomtest.chartofaccounts  AS acct_chart_of_accounts ON acct_chart_of_accounts.accountnumber=split_part(Advent_Chart_of_Accounts.accountnumber,'.',1)
LEFT JOIN tomtest.acct_division as Div on f_sql_adv_acct_to_division(Advent_GL_detail.accountnumber) = div.division_id
LEFT JOIN tomtest.acct_locations as Loc on f_sql_adv_acct_to_location(Advent_GL_detail.accountnumber) = loc.location_id
LEFT JOIN tomtest.acct_department as Dept on f_sql_adv_acct_to_department(Advent_GL_detail.accountnumber) = dept.department_id

WHERE (document_info <> 'AUTOMATIC BALFWD' and control <> 'NOT APPLICABLE')
-- WHERE red_dimdate.firstdayofmonth1 > '2017-12-31'
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21

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

  dimension: full_account_number {
    type: string
    sql: ${TABLE}.accountnumber ;;
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

  dimension: account {
    type: number
    sql: ${TABLE}.account ;;
  }

  dimension: account_name {
    type: string
    order_by_field: account
    sql: ${TABLE}.account_name ;;
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

  dimension: is_balance_sheet_acct {
    type: string
    sql: ${TABLE}.is_bal_sheet_acct ;;
  }

  dimension: period_amount {
    type: number
    sql: ${TABLE}.period_amount ;;
  }

  dimension: life_to_date_amount {
    type: number
    sql: ${TABLE}.ltd_amount ;;
  }

  measure: total_period_amount {
    type: sum
    sql: ${period_amount} ;;
  }

  measure:LTD_Amount {
    type: sum
    sql: ${life_to_date_amount} ;;
  }
  measure: total_period_amount_fin {
    type: sum
    sql: ${period_amount}*${financials_multiplier} ;;
  }

  measure:LTD_Amount_fin {
    type: sum
    sql: ${life_to_date_amount}*${financials_multiplier} ;;
  }

}
