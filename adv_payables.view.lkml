view: adv_payables {

  derived_table: {
    sql: with balances as
(select
vendor_code,
vendor_name,
sum(case when datediff(day,date::date,getdate()::date)::int <= 15 and amount > 0 then amount else 0::numeric(19,2) end) as "0_15_Invoices",
sum(case when datediff(day,date::date,getdate()::date)::int between 16 and 30 and amount > 0 then amount else 0::numeric(19,2) end) as "16_30_invoices",
sum(case when datediff(day,date::date,getdate()::date)::int between 31 and 45 and amount > 0 then amount else 0::numeric(19,2) end) as "31_45_invoices",
sum(case when datediff(day,date::date,getdate()::date)::int between 46 and 60 and amount > 0 then amount else 0::numeric(19,2) end) as "46_60_invoices",
sum(case when datediff(day,date::date,getdate()::date)::int > 60 and amount > 0 then amount else 0::numeric(19,2) end) as "over_60_invoices",
sum(case when datediff(day,date::date,getdate()::date)::int <= 15 and amount < 0 then amount * -1 else 0::numeric(19,2) end) as "0_15_Payments",
sum(case when datediff(day,date::date,getdate()::date)::int between 16 and 30 and amount < 0 then amount * -1 else 0::numeric(19,2) end) as "16_30_Payments",
sum(case when datediff(day,date::date,getdate()::date)::int between 31 and 45 and amount < 0 then amount * -1 else 0::numeric(19,2) end) as "31_45_Payments",
sum(case when datediff(day,date::date,getdate()::date)::int between 46 and 60 and amount < 0 then amount * -1 else 0::numeric(19,2) end) as "Over_60_Payments",
sum(case when datediff(day,date::date,getdate()::date)::int > 60 and amount < 0 then amount * -1 else 0::numeric(19,2) end) as "Over_60_Payments",
sum(case when amount >= 0 then 1 else 0 end) as "Total_Num_of_Invoices",
sum(case when amount >= 0 then amount else 0::numeric(19,2) end) as "Total_Invoices",
sum(case when amount < 0 then 1 else 0 end) as "Total_Num_of_Payments",
sum(case when amount < 0 then amount *-1 else 0::numeric(19,2) end) as "Total_Payments",
sum(amount) as Total_Balance


from adv_ap_aging

where
  date::date > '2017-01-01'

   and vendor_code <>'1'

group  by 1,2

having sum(amount) <> 0

order by sum(amount) desc
)

select
balances.vendor_code,
  balances.vendor_name,

      (balances."0_15_invoices"  - LEAST(balances."0_15_invoices",(balances.total_payments - LEAST(balances."over_60_invoices" + balances."46_60_invoices" + balances."31_45_invoices" + balances."16_30_invoices" ,balances.total_payments  ))))
    AS "0_15",


    (balances."16_30_invoices"  - LEAST(balances."16_30_invoices",(balances.total_payments - LEAST(balances."over_60_invoices" + balances."46_60_invoices" + balances."31_45_invoices" ,balances.total_payments  ))))
    AS "16_30",



  (balances."31_45_invoices"  - LEAST(balances."31_45_invoices",(balances.total_payments - LEAST(balances."over_60_invoices" + balances."46_60_invoices" ,balances.total_payments  ))))
  AS "31_45",

  (balances."46_60_invoices"  - LEAST(balances."46_60_invoices",(balances.total_payments - LEAST(balances."over_60_invoices",balances.total_payments  ))))
  AS "46_60",

(balances."over_60_invoices"  - LEAST(balances."over_60_invoices",balances.total_payments  ) ) :: NUMERIC ( 19, 2 ) AS over_60,
  balances.total_balance,
  balances.Total_num_of_invoices,
  balances.total_invoices,
  balances.Total_num_of_payments,
  balances.total_payments

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
