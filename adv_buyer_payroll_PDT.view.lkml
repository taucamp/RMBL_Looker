view: adv_buyer_payroll_pdt {

  derived_table: {persist_for: "4 hours"
    sql:
       WITH  unfunded AS
(SELECT gl.control, sum(gl.amount)::numeric as Excess_AR
  FROM adv_gl_detail gl
  JOIN ref_buyer_payplan_accounts BPA ON GL.accountnumber = BPA.accountnumber
  WHERE BPA.payroll_category = 'Pending AR'
  GROUP BY 1
  HAVING SUM(amount) > 1000
)

SELECT
   CASE WHEN SD.deal_status ilike 'CLSD' THEN 'CLOSED' ELSE  SD.deal_status end as deal_status,
  SD.dealer,
  SD.deal_number,
  SD.stock_number,
CASE

    WHEN SD.sale_type LIKE'6 WH%' THEN
    'Wholesale'
    WHEN SD.sale_type LIKE'1 RT%' THEN
    'Retail'
    WHEN SD.sale_type LIKE'4 TR%' THEN
    'Trade' ELSE'Other'
  END AS sale_type,
  SD.Sales_channel,
  SD.customer_number,
  SD.customer_name,
  SD.sale_date::date,
  f_sql_date_to_datekey(SD.sale_date::date) as sale_datekey,
  SD.days_in_inventory,
  case when sd.sales_channel ilike 'DIRECT TO CO%' and inv.vehicle_type <> 'Other'
      then nvl(P2.buyername, INV.buyer_name, SD.buyer_name)
      else SD.buyer_name
      end
      as buyer_name,
  'Unknown' AS BuyerType,
  INV.vin,
  SD.close_date::date,
  f_sql_date_to_datekey(SD.close_date::date) as deal_close_datekey,
  nvl(org.description,'Unknown') AS vehicle_origin,
  INV.YEAR as model_year,
  INV.make,
  INV.model,
  INV.mileage,
  ASU.unwind_date,
    f_sql_date_to_datekey(ASU.unwind_date::date) as Unwind_datekey,
    nvl(Excess_AR,0::numeric) as Excess_AR,
    nvl(DS.fee::numeric,0::numeric) as Dealer_Sales_Fee,
    BPA.payroll_category,
    case BPA.Payroll_Category
      when 'Revenue' then 1
      when 'COGS' then 2
      when 'Freight' then 3
      when 'Recon' then 4
      when 'Buy Fee' then 5
      when 'Goodwill Arb' then 6
      when 'Sales Fee' then 7
      when 'Pending AR' then 8
      else 99
      end as payroll_category_rank,
    nvl(br.buyer_participation_rate,0.00) as participation_rate,
    nvl(ba.buyer_add_back,0) as buyer_add_back,
    GL.accounting_date::date,
    f_sql_date_to_datekey(GL.accounting_date::date) as accounting_datekey,
    GL.accountnumber,
    CHT.accounttitle,
    GL.journalid,
    GL."comment" as comment,
    GL.control,
    GL.document_number,
    GL.document_info,
    GL.entry_timestamp,
    USR.user_name,
    (GL.amount
      + (CASE WHEN SD.sale_date::date < '2019-09-17' AND (LEFT(SD.customer_name,7) = 'MANHEIM' or LEFT(SD.customer_name,7) = 'OVE-MAN') THEN 100 ELSE 0 END))
      * (CASE WHEN  BPA.Payroll_Category = 'Revenue' THEN -1 ELSE 1 END) AS GL_Amount


FROM
  adv_sales_detail SD
  LEFT JOIN adv_invt_detail INV
    ON SD.dealer = INV.dealer
    AND SD.stock_number = INV.stock_number
  LEFT JOIN adv_invt_veh_origin ORG
    ON INV.dealer = ORG.dealer
    AND INV.vehicle_origin_code = ORG.code
  LEFT JOIN rumble_invitem p2
    ON SD.stock_number = p2.adventstocknumber
    AND p2.isactive = 1

  --Added 20190929
  LEFT JOIN ref_buyer_participation_rate br
    ON  CASE  WHEN sd.sales_channel ILIKE 'DIRECT TO CO%' AND inv.vehicle_type <> 'Other'
              THEN nvl(P2.buyername, INV.buyer_name, SD.buyer_name)
              ELSE SD.buyer_name
              END = br.Employee_name
      AND SD.sale_date::date BETWEEN br.date_start and br.date_end
--  --Added 20190929
  LEFT JOIN ref_buyer_addback ba
    ON  CASE  WHEN sd.sales_channel ILIKE 'DIRECT TO CO%' AND inv.vehicle_type <> 'Other'
              THEN nvl(P2.buyername, INV.buyer_name, SD.buyer_name)
              ELSE SD.buyer_name
            END = ba.Employee_name
        AND SD.sale_date::date BETWEEN ba.date_start and ba.date_end

  LEFT JOIN adv_sales_unwinds ASU
    ON SD.DEALER = ASU.dealer
    AND SD.deal_number = ASU.deal_number
  LEFT JOIN unfunded UNF
    ON SD.vin_last8  = UNF.control
  LEFT JOIN wholesale_dealer_sales DS
    ON SD.VIN_last8 = f_sql_adv_inventory_vin_last8(DS.VIN)
    AND (SD.sale_date::date between DS.date_sold::date - 10 AND DS.date_sold::date + 10)
  LEFT JOIN adv_gl_detail GL
    ON GL.control = SD.vin_last8
  JOIN ref_buyer_payplan_accounts BPA
    ON GL.accountnumber = BPA.accountnumber
  JOIN adv_gl_chart cht
    ON GL.accountnumber = CHT.accountnumber
  LEFT JOIN adv_users USR
    ON USR.dealer_guid = '229958da-f658-480f-a306-1cd642cae628'
    AND GL.user::decimal = USR.user_id::decimal


WHERE
  SD.SALE_DATE >= '2019-07-01'
  AND LEFT ( SD.SALE_TYPE, 1 ) <> '4'
  AND INV.VEHICLE_TYPE <> 'Other'


ORDER BY
  SD.buyer_name,
  SD.stock_number,
  SD.sale_date,
  GL.accountnumber



                ;;

      datagroup_trigger: financial_datagroup
      distribution_style: all

    }

    }
