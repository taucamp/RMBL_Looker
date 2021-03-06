view: adv_buyer_payroll_pdt {

  derived_table: {
    # persist_for: "8 hours"
    sql:
           WITH  unfunded AS
(SELECT gl.control, sum(gl.amount)::numeric as Excess_AR
  FROM adv_gl_detail gl
  JOIN ref_buyer_payplan_accounts BPA ON GL.accountnumber = BPA.accountnumber
  WHERE BPA.payroll_category = 'Pending AR'
  GROUP BY 1
  HAVING SUM(amount) > 1000
),

  dupes as (SELECT
      vin_last8,
      COUNT(vin_last8)
      FROM adv_sales_detail
      GROUP BY vin_last8
      HAVING COUNT(vin_last8) > 1
      )



SELECT
   CASE WHEN SD.deal_status ilike 'CLSD' THEN 'CLOSED' ELSE  SD.deal_status end as deal_status,
  SD.dealer,
  SD.deal_number,
  SD.stock_number,
  CASE WHEN dupes.vin_last8 IS NULL THEN 'No' ELSE 'Yes' END AS LAST8_ON_MULTIPLE_DEALS,
CASE
    WHEN SD.sale_type LIKE'6 WH%' THEN
    'Wholesale'
    WHEN SD.sale_type LIKE'1 RT%' THEN
    'Retail'
    WHEN SD.sale_type LIKE'4 TR%' THEN
    'Trade' ELSE'Other'
  END AS sale_type,
  SD.Sales_channel as Sales_channel_orig,
  f_sql_adv_sales_channel(SD.sales_channel) as sales_channel,
  SD.customer_number,
  SD.customer_name,
  SD.sale_date::date,
  f_sql_date_to_datekey(SD.sale_date::date) as sale_datekey,
  SD.days_in_inventory,

  case when sd.buyer_id is not null then 'Inventory_buyer'
       when P2.pickupcontact is not null and trim(P2.pickupcontact) <> '' then 'Carvis_buyer'
      else 'Unknown'
      end
      as Buyer_data_source,
  /*
  commented out on 2019-10-31 - replaced with Buyer name from Users table as opposed to Advent Table
  -nvl(INV.buyer_name, P2.pickupcontact,'Unknown') as buyer_name,
  */
  nvl(buyid.user_full_name, P2.pickupcontact,'Unknown') as buyer_name,
  'Unknown' AS BuyerType,
  SD.buyer_id as sales_person1_id,

  /* Commented out and add following line 2019-10-31 tp change source of full name */
  --SD.buyer_name as sales_person1_name,
  nvl(sp1id.user_full_name,'Unknown') as sales_person1_name,

  SD.salesperson2_id as sales_person2_id,
  /* Commented out and add following line 2019-10-31 tp change source of full name */
  nvl(sp2id.user_full_name,'Unknown') as sales_person2_name,


  SD.salesperson3_id as sales_person3_id,
  /* Commented out and add following line 2019-10-31 tp change source of full name */
  nvl(sp3id.user_full_name,'Unknown') as sales_person3_name,

INV.vin,
  SD.close_date::date,
  f_sql_date_to_datekey(SD.close_date::date) as deal_close_datekey,
  nvl(org.description,'Unknown') AS vehicle_origin,

  /* Added line below on 2019-10-31' */
  NVL(inv.vehicle_type,'Uknown') AS vehicle_type,
  INV.YEAR as model_year,
  INV.make,
  INV.model,
  INV.mileage,
  ASU.unwind_date,
    f_sql_date_to_datekey(ASU.unwind_date::date) as Unwind_datekey,
    nvl(Excess_AR,0::numeric) as Excess_AR,
    case when f_sql_char_to_numeric(cash_sale_price)/100 - trunc(f_sql_char_to_numeric(cash_sale_price)/100) = .69
        then 'no_commission_paid'
        else 'Commission_payable'
        end as blow_out_priced,
    nvl(DS.fee::numeric,0::numeric) as Dealer_Sales_Fee,
    1 as Pay_plan_number,
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
    USR.user_full_name as user_name,
  GL.amount * (CASE WHEN  BPA.Payroll_Category = 'Revenue' THEN -1 ELSE 1 END) AS GL_Amount,
  sd.buyer_name as Sales_Detail_Salesperson1,
  sd.salesperson2_fullname as Sales_Detail_Salesperson2,
  sd.salesperson3_fullname as Sales_Detail_Salesperson3,
  inv.buyer_id as Inventory_buyer_id,
  INV.buyer_name as Inventory_buyer_name_invalid,
  P2.pickupcontact as p2_pickupcontact,
  INV.received_date,
  p2.inventorydate


FROM
   adv_sales_detail SD
  LEFT JOIN dupes
    ON SD.vin_last8 = DUPES.vin_last8

  LEFT JOIN adv_invt_detail INV
    ON SD.dealer = INV.dealer
    AND SD.stock_number = INV.stock_number
  /* Added line below on 2019-10-31' */
  LEFT JOIN adv_users_tom buyid
    ON buyid.dealer = 'WHOLESALE, INC'
    AND inv.buyer_id::Decimal = buyid.user_id::decimal

  LEFT JOIN adv_invt_veh_origin ORG
    ON INV.dealer = ORG.dealer
    AND INV.vehicle_origin_code = ORG.code

LEFT JOIN rumble_invitem p2
    ON SD.stock_number = p2.adventstocknumber
    AND p2.isactive = 1



/* Added line below on 2019-10-31' */
  LEFT JOIN adv_users_tom sp1id
    ON sp1id.dealer = 'WHOLESALE, INC'
    AND sd.buyer_id::Decimal = sp1id.user_id::decimal

/* Added line below on 2019-10-31' */
  LEFT JOIN adv_users_tom sp2id
    ON sp2id.dealer = 'WHOLESALE, INC'
    AND sd.salesperson2_id::Decimal = sp2id.user_id::decimal

/* Added line below on 2019-10-31' */
  LEFT JOIN adv_users_tom sp3id
    ON sp3id.dealer = 'WHOLESALE, INC'
    AND sd.salesperson3_id::Decimal = sp3id.user_id::decimal


  --Added 20190929
 LEFT JOIN ref_buyer_participation_rate br
    ON  CASE  WHEN sd.sales_channel ILIKE 'DIRECT TO CO%' AND NVL(inv.vehicle_type,'Uknown') <> 'Other'
              THEN nvl(P2.buyername, INV.buyer_name, SD.buyer_name)
              ELSE SD.buyer_name
              END = br.Employee_name
      AND SD.sale_date::date BETWEEN br.date_start and br.date_end
--  --Added 20190929
  LEFT JOIN ref_buyer_addback ba
    ON  CASE  WHEN sd.sales_channel ILIKE 'DIRECT TO CO%' AND NVL(inv.vehicle_type,'Uknown') <> 'Other'
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
  LEFT JOIN vw_adv_gl_detail_2019_2020 GL
    ON GL.control = SD.vin_last8
 JOIN ref_buyer_payplan_accounts BPA
    ON GL.accountnumber = BPA.accountnumber
  JOIN adv_gl_chart cht
    ON GL.accountnumber = CHT.accountnumber
  LEFT JOIN adv_users_tom USR
--     ON USR.dealer_guid = '229958da-f658-480f-a306-1cd642cae628'
--     AND GL.user::decimal = USR.user_id::decimal
-- adv_users_tom usr
    ON usr.dealer = 'WHOLESALE, INC'
    AND gl.user::decimal = usr.user_id::decimal

WHERE
  SD.SALE_DATE > '2019-06-30'
  AND LEFT (SD.SALE_TYPE, 1 ) <> '4'
  AND NVL(inv.vehicle_type,'Uknown') <> 'Other'


ORDER BY
  SD.buyer_name,
  SD.stock_number,
  SD.sale_date,
  GL.accountnumber



                ;;

    publish_as_db_view: yes
    datagroup_trigger: financial_datagroup
    distribution_style: all

    # datagroup_trigger: buyer_payroll_datagroup
      # sql_trigger_value:  SELECT FLOOR(EXTRACT(epoch from GETDATE()) / (4*60*60)) ;;
      # distribution_style: all

    }

    }
