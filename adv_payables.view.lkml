view: adv_payables {

  derived_table: {
    sql: with balances as
(
select
vendor_code,
vendor_name,
sum(case when datediff(day,date::date,getdate()::date)::int < 15 and amount > 0 then amount else 0::numeric(19,2) end) as "0_15_Invoices",
sum(case when datediff(day,date::date,getdate()::date)::int between 16 and 30 and amount > 0 then amount else 0::numeric(19,2) end) as "16_30_Invoices",
sum(case when datediff(day,date::date,getdate()::date)::int between 31 and 45 and amount > 0 then amount else 0::numeric(19,2) end) as "31_45_Invoices",
sum(case when datediff(day,date::date,getdate()::date)::int between 46 and 60 and amount > 0 then amount else 0::numeric(19,2) end) as "46_60_Invoices",
sum(case when datediff(day,date::date,getdate()::date)::int > 60 and amount > 0 then amount else 0::numeric(19,2) end) as "Over_60_Invoices",
sum(case when datediff(day,date::date,getdate()::date)::int < 15 and amount < 0 then amount else 0::numeric(19,2) end) as "0_15_Payments",
sum(case when datediff(day,date::date,getdate()::date)::int between 16 and 30 and amount < 0 then amount else 0::numeric(19,2) end) as "16_30_Payments",
sum(case when datediff(day,date::date,getdate()::date)::int between 31 and 45 and amount < 0 then amount else 0::numeric(19,2) end) as "31_45_Payments",
sum(case when datediff(day,date::date,getdate()::date)::int between 46 and 60 and amount < 0 then amount else 0::numeric(19,2) end) as "Over_60_Payments",
sum(case when datediff(day,date::date,getdate()::date)::int > 60 and amount < 0 then amount else 0::numeric(19,2) end) as "Over_60_Payments",
sum(case when amount < 0 then amount else 0::numeric(19,2) end) as "Total_Payments",
sum(amount) as Total_Balance

from adv_ap_aging

where
  date::date > '2017-01-01'
  and vendor_code <> '1'

group  by 1,2

having sum(amount) <> 0

order by sum(amount) desc
)


select
vendor_code,
vendor_name,
"0_15_Invoices" - (Total_Payments-LEAST(Over_60_Invoices + "46_60_Invoices" + "31_45_Invoices" + "16_30_Invoices", Total_Payments)) as "0_15",
"16_30_Invoices" - (Total_Payments-LEAST(Over_60_Invoices + "46_60_Invoices" + "31_45_Invoices", Total_Payments)) as "16_30",
"31_45_Invoices" - (Total_Payments-LEAST("Over_60_Invoices" + "46_60_Invoices", Total_Payments)) as "31_45",
"46_60_Invoices" - (Total_Payments-LEAST(Over_60_Invoices, Total_Payments)) as "46_60",
GREATEST(0,Over_60_Invoices - Total_Payments) as "Over_60",
Total_Balance,
total_payments

from balances
order by 8 desc


          ;;

      datagroup_trigger: financial_datagroup
      distribution_style: all

    }

  dimension: vendor_code {
    type: string
    sql: ${TABLE}.vendor_code ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }


########
########
# MEASURES
########
########


  measure: 0_15_Balance {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.0_15 ;;
  }

  measure: 16_30_Balance {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.16_30 ;;
  }

  measure: 31_45_Balance {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.31_45 ;;
  }

  measure: 46_60_Balance {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.46_60 ;;
  }

  measure: Over_60_Balance {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.Over_60 ;;
  }


  measure: Total_Balance {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.Total_balance ;;
  }


  measure: Total_Payments {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.total_payments ;;
  }


  }
