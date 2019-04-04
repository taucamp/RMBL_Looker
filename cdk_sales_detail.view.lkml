view: cdk_sales_detail {
  sql_table_name: public.aaa_cdk_sales_detail ;;

  dimension: appraisal__acquisition_source {
    type: string
    sql: ${TABLE}."appraisal - acquisition source" ;;
  }

  dimension: appraisal__aesthetic_value {
    type: number
    sql: ${TABLE}."appraisal - aesthetic value" ;;
  }

  dimension: appraisal__appraiser {
    type: string
    sql: ${TABLE}."appraisal - appraiser" ;;
  }

  dimension: appraisal__est_freight {
    type: number
    sql: ${TABLE}."appraisal - est freight" ;;
  }

  dimension: appraisal__est_margin {
    type: number
    sql: ${TABLE}."appraisal - est margin" ;;
  }

  dimension: appraisal__mechanical_value {
    type: number
    sql: ${TABLE}."appraisal - mechanical value" ;;
  }

  dimension: appraisal__recon_amount {
    type: number
    sql: ${TABLE}."appraisal - recon amount" ;;
  }

  dimension: appraisal__seller_city {
    type: string
    sql: ${TABLE}."appraisal - seller city" ;;
  }

  dimension: appraisal__seller_name {
    type: string
    sql: ${TABLE}."appraisal - seller name" ;;
  }

  dimension: appraisal__seller_zip {
    type: string
    sql: ${TABLE}."appraisal - seller zip" ;;
  }

  dimension: appraisal__tire_condition_value {
    type: number
    sql: ${TABLE}."appraisal - tire condition value" ;;
  }

  dimension: appraisal_offer_price {
    type: number
    sql: ${TABLE}."appraisal offer price" ;;
  }

  dimension: appraisal_supervisor {
    type: string
    sql: ${TABLE}."appraisal supervisor" ;;
  }

  dimension: appraiser {
    type: string
    sql: ${TABLE}.appraiser ;;
  }

  dimension: auction_fee {
    type: number
    sql: ${TABLE}."auction fee" ;;
  }

  dimension: back_we_owe {
    type: number
    sql: ${TABLE}."back we owe" ;;
  }

  dimension: bank_fee {
    type: number
    sql: ${TABLE}."bank fee" ;;
  }

  dimension: cash_down {
    type: number
    sql: ${TABLE}."cash down" ;;
  }

  dimension: cash_or_finance {
    type: string
    sql: ${TABLE}."cash or finance" ;;
  }

  dimension: cash_price {
    type: number
    sql: ${TABLE}."cash price" ;;
  }

  dimension: cash_price_bucket {
    type: string
    sql: ${TABLE}."cash price bucket" ;;
  }

  dimension: cash_price_vs_appraisal {
    type: number
    sql: ${TABLE}."cash price vs appraisal" ;;
  }

  dimension: cash_price_vs_appraisal_bucket {
    type: string
    sql: ${TABLE}."cash price vs appraisal bucket" ;;
  }

  dimension: commissions__sales_dealer {
    type: number
    sql: ${TABLE}."commissions - sales dealer" ;;
  }

  dimension: consumer__dealer__auction {
    type: string
    sql: ${TABLE}."consumer - dealer - auction" ;;
  }

  dimension: cos__misc {
    type: number
    sql: ${TABLE}."cos - misc" ;;
  }

  dimension: cust__address_line_2 {
    type: string
    sql: ${TABLE}."cust - address line 2" ;;
  }

  dimension: cust__country {
    type: string
    sql: ${TABLE}."cust - country" ;;
  }

  dimension: cust__county {
    type: string
    sql: ${TABLE}."cust - county" ;;
  }

  dimension: cust__gender {
    type: string
    sql: ${TABLE}."cust - gender" ;;
  }

  dimension: cust__name_company {
    type: string
    sql: ${TABLE}."cust - name company" ;;
  }

  dimension: cust__state {
    type: string
    sql: ${TABLE}."cust - state" ;;
  }

  dimension: cust__zip {
    type: string
    sql: ${TABLE}."cust - zip" ;;
  }

  dimension: customer__address {
    type: string
    sql: ${TABLE}."customer - address" ;;
  }

  dimension: customer__age {
    type: number
    sql: ${TABLE}."customer - age" ;;
  }

  dimension: customer__city {
    type: string
    sql: ${TABLE}."customer - city" ;;
  }

  dimension: customer__county {
    type: string
    sql: ${TABLE}."customer - county" ;;
  }

  dimension: customer__state {
    type: string
    sql: ${TABLE}."customer - state" ;;
  }

  dimension: customer__zip {
    type: string
    sql: ${TABLE}."customer - zip" ;;
  }

  dimension: customer_name__last_first {
    type: string
    sql: ${TABLE}."customer name - last first" ;;
  }

  dimension: customer_number {
    type: string
    sql: ${TABLE}."customer number" ;;
  }

  dimension_group: date__first_booked {
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
    sql: ${TABLE}."date - first booked" ;;
  }

  dimension_group: date__first_booked__month_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date - first booked - month of" ;;
  }

  dimension_group: date__first_booked__week_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date - first booked - week of" ;;
  }

  dimension_group: date__most_recent {
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
    sql: ${TABLE}."date - most recent" ;;
  }

  dimension_group: date_accounting {
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
    sql: ${TABLE}."date accounting" ;;
  }

  dimension_group: date_accounting__month_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date accounting - month of" ;;
  }

  dimension_group: date_accounting__week_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date accounting - week of" ;;
  }

  dimension_group: date_booked {
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
    sql: ${TABLE}."date booked" ;;
  }

  dimension_group: date_booked__month_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date booked - month of" ;;
  }

  dimension_group: date_booked__week_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date booked - week of" ;;
  }

  dimension_group: date_contract {
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
    sql: ${TABLE}."date contract" ;;
  }

  dimension_group: date_contract__month_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date contract - month of" ;;
  }

  dimension_group: date_contract__week_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date contract - week of" ;;
  }

  dimension_group: date_entered_into_inventory {
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
    sql: ${TABLE}."date entered into inventory" ;;
  }

  dimension_group: date_finalized {
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
    sql: ${TABLE}."date finalized" ;;
  }

  dimension_group: date_finalized__month_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date finalized - month of" ;;
  }

  dimension_group: date_finalized__week_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date finalized - week of" ;;
  }

  dimension_group: date_most_recent__month_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date most recent - month of" ;;
  }

  dimension_group: date_most_recent__week_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date most recent - week of" ;;
  }

  dimension_group: date_pending {
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
    sql: ${TABLE}."date pending" ;;
  }

  dimension_group: date_pending__month_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date pending - month of" ;;
  }

  dimension_group: date_pending__week_of {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date pending - week of" ;;
  }

  dimension_group: date_received_into_inventory {
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
    sql: ${TABLE}."date received into inventory" ;;
  }

  dimension: days_from_contract_to_booked {
    type: number
    sql: ${TABLE}."days from contract to booked" ;;
  }

  dimension: days_from_contract_to_finalized {
    type: number
    sql: ${TABLE}."days from contract to finalized" ;;
  }

  dimension: days_in_inventory {
    type: number
    sql: ${TABLE}."days in inventory" ;;
  }

  dimension: days_in_inventory_bucket {
    type: string
    sql: ${TABLE}."days in inventory bucket" ;;
  }

  dimension: deal_number {
    type: number
    sql: ${TABLE}."deal number" ;;
  }

  dimension: deal_status {
    type: string
    sql: ${TABLE}."deal status" ;;
  }

  dimension: deal_type {
    type: string
    sql: ${TABLE}."deal type" ;;
  }

  dimension: fee__consumer_benefits {
    type: number
    sql: ${TABLE}."fee - consumer benefits" ;;
  }

  dimension: fee__lien {
    type: number
    sql: ${TABLE}."fee - lien" ;;
  }

  dimension: fee__tag {
    type: number
    sql: ${TABLE}."fee - tag" ;;
  }

  dimension: fee__title {
    type: number
    sql: ${TABLE}."fee - title" ;;
  }

  dimension: finance_charge {
    type: number
    sql: ${TABLE}."finance charge" ;;
  }

  dimension: finance_income {
    type: number
    sql: ${TABLE}."finance income" ;;
  }

  dimension: finance_manager {
    type: string
    sql: ${TABLE}."finance manager" ;;
  }

  dimension: finance_manager_id {
    type: string
    sql: ${TABLE}."finance manager id" ;;
  }

  dimension: finance_wip_status {
    type: string
    sql: ${TABLE}."finance wip status" ;;
  }

  dimension: financed_amount {
    type: number
    sql: ${TABLE}."financed amount" ;;
  }

  dimension: financing_source {
    type: string
    sql: ${TABLE}."financing source" ;;
  }

  dimension: freight__inbound {
    type: number
    sql: ${TABLE}."freight - inbound" ;;
  }

  dimension: freight__outbound {
    type: number
    sql: ${TABLE}."freight - outbound" ;;
  }

  dimension: freight__total {
    type: number
    sql: ${TABLE}."freight - total" ;;
  }

  dimension: gross__back {
    type: number
    sql: ${TABLE}."gross - back" ;;
  }

  dimension: gross__back_ {
    type: number
    sql: ${TABLE}."gross - back %" ;;
  }

  dimension: gross__back__bucket {
    type: string
    sql: ${TABLE}."gross - back % bucket" ;;
  }

  dimension: gross__back_bucket {
    type: string
    sql: ${TABLE}."gross - back bucket" ;;
  }

  dimension: gross__front {
    type: number
    sql: ${TABLE}."gross - front" ;;
  }

  dimension: gross__front_ {
    type: number
    sql: ${TABLE}."gross - front %" ;;
  }

  dimension: gross__front__bucket {
    type: string
    sql: ${TABLE}."gross - front % bucket" ;;
  }

  dimension: gross__front_bucket {
    type: string
    sql: ${TABLE}."gross - front bucket" ;;
  }

  dimension: gross_margin__total {
    type: number
    sql: ${TABLE}."gross margin - total" ;;
  }

  dimension: gross_profit__front_end_ {
    type: number
    sql: ${TABLE}."gross profit - front end " ;;
  }

  dimension: gross_profit__vehicle {
    type: number
    sql: ${TABLE}."gross profit - vehicle" ;;
  }

  dimension: harley_v_metric {
    type: string
    sql: ${TABLE}."harley v metric" ;;
  }

  dimension: includes_bank_fee {
    type: string
    sql: ${TABLE}."includes bank fee" ;;
  }

  dimension: includes_cost_adjustments {
    type: string
    sql: ${TABLE}."includes cost adjustments" ;;
  }

  dimension: includes_fee_income {
    type: string
    sql: ${TABLE}."includes fee income" ;;
  }

  dimension: includes_insurance_or_warranty {
    type: string
    sql: ${TABLE}."includes insurance or warranty" ;;
  }

  dimension: includes_recon {
    type: string
    sql: ${TABLE}."includes recon" ;;
  }

  dimension: includes_tradein {
    type: string
    sql: ${TABLE}."includes trade-in" ;;
  }

  dimension: insurance_1__cost {
    type: number
    sql: ${TABLE}."insurance 1 - cost" ;;
  }

  dimension: insurance_1__fee {
    type: number
    sql: ${TABLE}."insurance 1 - fee" ;;
  }

  dimension: insurance_1__income {
    type: number
    sql: ${TABLE}."insurance 1 - income" ;;
  }

  dimension: insurance_cost__total {
    type: number
    sql: ${TABLE}."insurance cost - total" ;;
  }

  dimension: insurance_fees__total {
    type: number
    sql: ${TABLE}."insurance fees - total" ;;
  }

  dimension: insurance_income__total {
    type: number
    sql: ${TABLE}."insurance income - total" ;;
  }

  dimension: inventory_location {
    type: string
    sql: ${TABLE}."inventory location" ;;
  }

  dimension: is_financed {
    type: string
    sql: ${TABLE}."is financed" ;;
  }

  dimension: lienholder_name {
    type: string
    sql: ${TABLE}."lienholder name" ;;
  }

  dimension: maint_contract__cost {
    type: number
    sql: ${TABLE}."maint contract - cost" ;;
  }

  dimension: maint_contract__fee {
    type: number
    sql: ${TABLE}."maint contract - fee" ;;
  }

  dimension: maint_contract__income {
    type: number
    sql: ${TABLE}."maint contract - income" ;;
  }

  dimension: monthly_payment {
    type: number
    sql: ${TABLE}."monthly payment" ;;
  }

  dimension: monthly_payment___of {
    type: number
    sql: ${TABLE}."monthly payment - # of"
      ;;
  }

  dimension: monthly_payments__total {
    type: number
    sql: ${TABLE}."monthly payments - total" ;;
  }

  dimension: option_fees__total {
    type: number
    sql: ${TABLE}."option fees - total" ;;
  }

  dimension: options_fees_financed__total {
    type: number
    sql: ${TABLE}."options fees financed - total" ;;
  }

  dimension: out_the_door_price {
    type: number
    sql: ${TABLE}."out the door price" ;;
  }

  dimension: recon__auction {
    type: number
    sql: ${TABLE}."recon - auction" ;;
  }

  dimension: recon__calc {
    type: number
    sql: ${TABLE}."recon - calc" ;;
  }

  dimension: recon__consumer {
    type: number
    sql: ${TABLE}."recon - consumer" ;;
  }

  dimension: recon__dealer {
    type: number
    sql: ${TABLE}."recon - dealer" ;;
  }

  dimension: recon__total {
    type: number
    sql: ${TABLE}."recon - total" ;;
  }

  dimension: safe_gap__cost {
    type: number
    sql: ${TABLE}."safe gap - cost" ;;
  }

  dimension: safe_gap__fee {
    type: number
    sql: ${TABLE}."safe gap - fee" ;;
  }

  dimension: safe_gap__income {
    type: number
    sql: ${TABLE}."safe gap - income" ;;
  }

  dimension: safeguard__cost {
    type: number
    sql: ${TABLE}."safeguard - cost" ;;
  }

  dimension: safeguard__fee {
    type: number
    sql: ${TABLE}."safeguard - fee" ;;
  }

  dimension: safeguard__income {
    type: number
    sql: ${TABLE}."safeguard - income" ;;
  }

  dimension: sale_prices_with_we_owes {
    type: number
    sql: ${TABLE}."sale prices with we owes" ;;
  }

  dimension: sales_manager {
    type: string
    sql: ${TABLE}."sales manager" ;;
  }

  dimension: salesperson {
    type: string
    sql: ${TABLE}.salesperson ;;
  }

  dimension: stock_number {
    type: string
    sql: ${TABLE}."stock number" ;;
  }

  dimension: tax_amount__total {
    type: number
    sql: ${TABLE}."tax amount - total" ;;
  }

  dimension: texas_gap_insurance {
    type: number
    sql: ${TABLE}."texas gap insurance" ;;
  }

  dimension: trade1__actual_cash_value {
    type: number
    sql: ${TABLE}."trade1 - actual cash value" ;;
  }

  dimension: trade1__color {
    type: string
    sql: ${TABLE}."trade1 - color" ;;
  }

  dimension: trade1__gross {
    type: number
    sql: ${TABLE}."trade1 - gross" ;;
  }

  dimension: trade1__make {
    type: string
    sql: ${TABLE}."trade1 - make" ;;
  }

  dimension: trade1__makename {
    type: string
    sql: ${TABLE}."trade1 - makename" ;;
  }

  dimension: trade1__mileage {
    type: number
    sql: ${TABLE}."trade1 - mileage" ;;
  }

  dimension: trade1__model {
    type: string
    sql: ${TABLE}."trade1 - model" ;;
  }

  dimension: trade1__modelname {
    type: string
    sql: ${TABLE}."trade1 - modelname" ;;
  }

  dimension: trade1__modelno {
    type: string
    sql: ${TABLE}."trade1 - modelno" ;;
  }

  dimension: trade1__modeltype {
    type: string
    sql: ${TABLE}."trade1 - modeltype" ;;
  }

  dimension: trade1__over__under {
    type: number
    sql: ${TABLE}."trade1 - over / under" ;;
  }

  dimension: trade1__payoff {
    type: number
    sql: ${TABLE}."trade1 - payoff" ;;
  }

  dimension: trade1__stock_no {
    type: string
    sql: ${TABLE}."trade1 - stock no" ;;
  }

  dimension: trade1__style {
    type: string
    sql: ${TABLE}."trade1 - style" ;;
  }

  dimension: trade1__vin {
    type: string
    sql: ${TABLE}."trade1 - vin" ;;
  }

  dimension: trade1__year {
    type: number
    sql: ${TABLE}."trade1 - year" ;;
  }

  dimension: trade1_harley_v_metric {
    type: string
    sql: ${TABLE}."trade1 harley v metric" ;;
  }

  dimension: trade1year__year_bucket {
    type: string
    sql: ${TABLE}."trade1year - year bucket" ;;
  }

  dimension: trade2__actual_cash_value {
    type: number
    sql: ${TABLE}."trade2 - actual cash value" ;;
  }

  dimension: trade2__color {
    type: string
    sql: ${TABLE}."trade2 - color" ;;
  }

  dimension: trade2__gross {
    type: number
    sql: ${TABLE}."trade2 - gross" ;;
  }

  dimension: trade2__make {
    type: string
    sql: ${TABLE}."trade2 - make" ;;
  }

  dimension: trade2__makename {
    type: string
    sql: ${TABLE}."trade2 - makename" ;;
  }

  dimension: trade2__mileage {
    type: number
    sql: ${TABLE}."trade2 - mileage" ;;
  }

  dimension: trade2__model {
    type: string
    sql: ${TABLE}."trade2 - model" ;;
  }

  dimension: trade2__modelname {
    type: string
    sql: ${TABLE}."trade2 - modelname" ;;
  }

  dimension: trade2__modelno {
    type: string
    sql: ${TABLE}."trade2 - modelno" ;;
  }

  dimension: trade2__modeltype {
    type: string
    sql: ${TABLE}."trade2 - modeltype" ;;
  }

  dimension: trade2__over__under {
    type: number
    sql: ${TABLE}."trade2 - over / under" ;;
  }

  dimension: trade2__payoff {
    type: number
    sql: ${TABLE}."trade2 - payoff" ;;
  }

  dimension: trade2__stock_no {
    type: string
    sql: ${TABLE}."trade2 - stock no" ;;
  }

  dimension: trade2__style {
    type: string
    sql: ${TABLE}."trade2 - style" ;;
  }

  dimension: trade2__vin {
    type: string
    sql: ${TABLE}."trade2 - vin" ;;
  }

  dimension: trade2__year {
    type: number
    sql: ${TABLE}."trade2 - year" ;;
  }

  dimension: trade2__year_bucket {
    type: string
    sql: ${TABLE}."trade2 - year bucket" ;;
  }

  dimension: trade2_harley_v_metric {
    type: string
    sql: ${TABLE}."trade2 harley v metric" ;;
  }

  dimension: trades_actual_cash_value {
    type: number
    sql: ${TABLE}."trades actual cash value" ;;
  }

  dimension: trades_gross {
    type: number
    sql: ${TABLE}."trades gross" ;;
  }

  dimension: trades_over__under {
    type: number
    sql: ${TABLE}."trades over / under" ;;
  }

  dimension: trades_payoff {
    type: number
    sql: ${TABLE}."trades payoff" ;;
  }

  dimension: vehicle__body_style {
    type: string
    sql: ${TABLE}."vehicle - body style" ;;
  }

  dimension: vehicle__color {
    type: string
    sql: ${TABLE}."vehicle - color" ;;
  }

  dimension: vehicle__cost {
    type: number
    sql: ${TABLE}."vehicle - cost" ;;
  }

  dimension: vehicle__cost_gl {
    type: number
    sql: ${TABLE}."vehicle - cost gl" ;;
  }

  dimension: vehicle__make {
    type: string
    sql: ${TABLE}."vehicle - make" ;;
  }

  dimension: vehicle__mileage {
    type: number
    sql: ${TABLE}."vehicle - mileage" ;;
  }

  dimension: vehicle__mileage_bucket {
    type: string
    sql: ${TABLE}."vehicle - mileage bucket" ;;
  }

  dimension: vehicle__model {
    type: string
    sql: ${TABLE}."vehicle - model" ;;
  }

  dimension: vehicle__model_name {
    type: string
    sql: ${TABLE}."vehicle - model name" ;;
  }

  dimension: vehicle__year {
    type: number
    sql: ${TABLE}."vehicle - year" ;;
  }

  dimension: vehicle__year_bucket {
    type: string
    sql: ${TABLE}."vehicle - year bucket" ;;
  }

  dimension: vehicle_costs__adj__standard {
    type: number
    sql: ${TABLE}."vehicle costs - adj - standard" ;;
  }

  dimension: vehicle_costs__adj__total {
    type: number
    sql: ${TABLE}."vehicle costs - adj - total" ;;
  }

  dimension: vehicle_costs__base_from_inv {
    type: number
    sql: ${TABLE}."vehicle costs - base from inv" ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.vin ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Total_Sales{
    type: sum
    sql: ${cash_price} ;;
    drill_fields: [detail*]
  }

  measure: front_gross{
    type: sum
    sql: ${gross__front_} ;;
    drill_fields: [detail*]
  }

  measure: back_gross{
    type: sum
    sql: ${gross__back_} ;;
    drill_fields: [detail*]
  }

  measure: total_gross{
    type: sum
    sql: ${gross__front}+${gross__back} ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      appraisal__seller_name,
      trade2__modelname,
      trade2__makename,
      trade1__modelname,
      trade1__makename,
      lienholder_name,
      vehicle__model_name
    ]
  }
}
