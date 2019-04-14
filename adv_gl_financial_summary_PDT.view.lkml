view: adv_gl_financial_summary_pdt {

  derived_table: {
    sql: SELECT
  acct_chart_of_accounts.majorgroup_rank  AS "major_group_rank",
  acct_chart_of_accounts.majorgroup AS "major_group",
  acct_chart_of_accounts.minorgroup_rank  AS "minor_group_rank",
  acct_chart_of_accounts.minorgroup AS "minor_group",
  Advent_GL_detail.accountnumber,
  f_sql_adv_acct_to_division(Advent_GL_detail.accountnumber) as "division",
  f_sql_adv_acct_to_location(Advent_GL_detail.accountnumber) as "location",
  f_sql_adv_acct_to_department(Advent_GL_detail.accountnumber) as "department",
  acct_chart_of_accounts.accountnumber  AS "account",
  acct_chart_of_accounts.account  AS "account_name",
  typical_balance,
  financials_multiplier,
  a.firstdayofmonth1 as "accounting_month",
  --f_sql_date_to_first_day_of_month(Advent_GL_detail.accounting_date) AS "advent_gl_detail.accounting_date_month_1",
  is_bal_sheet_acct,
  SUM(CASE WHEN f_sql_date_to_first_day_of_month(Advent_GL_detail.accounting_date::date) = a.firstdayofmonth1 THEN Advent_GL_detail.amount*1 ELSE 0 END)::decimal(19,2) as "period_amount",
  SUM(Advent_GL_detail.amount*1)::decimal(19,2) as "ltd_amount"
FROM
  (select distinct firstdayofmonth1 from ref_dimdate where firstdayofmonth1 > '2017-12-31') a
LEFT JOIN public.adv_gldetail  AS Advent_GL_detail ON a.firstdayofmonth1 >= f_sql_date_to_first_day_of_month(Advent_GL_detail.accounting_date::date)
LEFT JOIN public.adv_glchart  AS Advent_Chart_of_Accounts ON Advent_Chart_of_Accounts.accountnumber=Advent_GL_detail.accountnumber
LEFT JOIN tomtest.chartofaccounts  AS acct_chart_of_accounts ON acct_chart_of_accounts.accountnumber=split_part(Advent_Chart_of_Accounts.accountnumber,'.',1)

-- WHERE red_dimdate.firstdayofmonth1 > '2017-12-31'
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14    ;;

    datagroup_trigger: financial_datagroup
    distribution_style: all

  }


  dimension: major_group {
    type: string
    order_by_field: major_group_rank
    sql: ${TABLE}.major_group ;;
  }

  dimension: major_group_rank {
    hidden: yes
    type: number
    sql: ${TABLE}.major_group_rank ;;
  }

  dimension: minor_group {
    type: string
    order_by_field: minor_group_rank
    sql: ${TABLE}.minor_groupk ;;
  }

  dimension: minor_group_rank {
    hidden: yes
    type: number
    sql: ${TABLE}.minor_group_rank ;;
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}.accountnumber ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: account {
    type: string
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
