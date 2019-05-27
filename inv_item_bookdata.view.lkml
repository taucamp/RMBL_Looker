view: inv_item_bookdata {
  sql_table_name: public.rumble_invitem_bookdata ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
    type: time
    hidden:yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
    type: time
    hidden:yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: category {
    type: string
    sql: nvl(${TABLE}.category,'Unknown') ;;
  }

  dimension: npa_book_value {
    type: number
    sql: nvl(${TABLE}.npabookvalue,0) ;;
  }

  dimension: npa_book_value_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.npabookvalue,1,0) ;;
  }


  dimension: inv_item_id {
    type: number
    sql: ${TABLE}.rumble_invitem_id ;;
  }

    dimension: vf_avg_score {
    type: number
    sql: nvl(${TABLE}.vfavgscore,0) ;;
  }

  dimension: vf_avg_score_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfavgscore,1,0) ;;
  }

    dimension: vf_avg_value {
    type: number
    sql: nvl(${TABLE}.vfavgvalue,0) ;;
  }

  dimension: vf_avg_value_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfavgvalue,1,0) ;;
  }

  dimension: vfbb_avg_retail {
    type: number
    sql: nvl(${TABLE}.vfbb_avgretail,0) ;;
  }

  dimension: vfbb_avgretail_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_avgretail,1,0) ;;
  }

  dimension: vfbb_avg_wholesale {
    type: number
    sql: nvl(${TABLE}.vfbb_avgwholesale,0) ;;
  }

  dimension: vfbb_avg_wholesale_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_avgwholesale,1,0) ;;
  }

  dimension: vfbb_clean_wholesale {
    type: number
    sql: nvl(${TABLE}.vfbb_cleanwholesale,0 ;;
  }

  dimension: vfbb_clean_wholesale_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_cleanwholesale,1,0) ;;
  }

  dimension: vfbb_equipped_retail {
    type: number
    sql: nvl(${TABLE}.vfbb_equippedretail,0) ;;
  }

  dimension: vfbb_equipped_retail_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_equippedretail,1,0) ;;
  }

  dimension: vfbb_msrp {
    type: number
    sql: nvl(${TABLE}.vfbb_msrp,0);;
  }

  dimension: vfbb_msrp_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_msrp,1,0) ;;
  }

  dimension: vfbb_roughwholesale {
    type: number
    sql: nvl(${TABLE}.vfbb_roughwholesale,0) ;;
  }

  dimension: vfbb_roughwholesale_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_roughwholesale,1,0) ;;
  }

  dimension: vfbb_trade_in_clean {
    type: number
    sql: nvl(${TABLE}.vfbb_tradeinclean,0) ;;
  }

  dimension: vfbb_trade_in_clean_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_tradeinclean,1,0) ;;
  }

  dimension: vfbb_trade_in_fair {
    type: number
    sql: nvl(${TABLE}.vfbb_tradeinfair,0) ;;
  }

  dimension: vfbb_trade_in_fair_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_tradeinfair,1,0) ;;
  }

  dimension: vfkbb_list_price {
    type: number
    sql: nvl(${TABLE}.vfkbb_listprice,0) ;;
  }

  dimension: vfkbb_list_price_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfkbb_listprice,1,0) ;;
  }

  dimension: vfkbb_suggested_retail {
    type: number
    sql: nvl(${TABLE}.vfkbb_suggestedretail,0) ;;
  }

  dimension: vfkbb_suggested_retail_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfkbb_suggestedretail,1,0) ;;
  }

  dimension: vfkbb_wholesale_avg {
    type: number
    sql: nvl(${TABLE}.vfkbb_wholesaleavg,0) ;;
  }

  dimension: vfkbb_wholesale_avg_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfkbb_wholesaleavg,1,0) ;;
  }

  dimension: vfmanheim_retail_above {
    type: number
    sql: nvl(${TABLE}.vfmanheim_retail_above,0) ;;
  }

  dimension: vfmanheim_retail_above_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_retail_above,1,0) ;;
  }

  dimension: vfmanheim_retail_average {
    type: number
    sql: nvl(${TABLE}.vfmanheim_retail_average,0) ;;
  }

  dimension: vfmanheim_retail_average_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_retail_average,1,0) ;;
  }

  dimension: vfmanheim_retail_below {
    type: number
    sql: nvl(${TABLE}.vfmanheim_retail_below,0) ;;
  }

  dimension: vfmanheim_retail_below_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_retail_below,1,0) ;;
  }

  dimension: vfmanheim_wholesale_above {
    type: number
    sql: nvl(${TABLE}.vfmanheim_wholesale_above,0) ;;
  }

  dimension: vfmanheim_wholesale_above_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_wholesale_above,1,0) ;;
  }

  dimension: vfmanheim_wholesale_average {
    type: number
    sql: nvl(${TABLE}.vfmanheim_wholesale_average,0 ;;
  }

  dimension: vfmanheim_wholesale_average_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_wholesale_average,1,0) ;;
  }

  dimension: vfmanheim_wholesale_below {
    type: number
    sql: nvl(${TABLE}.vfmanheim_wholesale_below,0) ;;
  }

  dimension: vfmanheim_wholesale_below_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_wholesale_below,1,0) ;;
  }

  dimension: vfnada_avg_retail {
    type: number
    sql: nvl(${TABLE}.vfnada_avgretail,0) ;;
  }

  dimension: vfnada_avg_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfnada_avgretail,1,0) ;;
  }

  dimension: vfnada_categorytype {
    type: string
    sql: nvl(${TABLE}.vfnada_categorytype,'Unknown') ;;
  }

  dimension: vfnada_clean {
    type: number
    sql: nvl(${TABLE}.vfnada_clean,0) ;;
  }

  dimension: vfnada_cleanretail {
    type: number
    sql: nvl(${TABLE}.vfnada_cleanretail,0) ;;
  }

  dimension: vfnada_estinvoice {
    type: number
    sql: nvl(${TABLE}.vfnada_estinvoice,0) ;;
  }

  dimension: vfnada_msrp {
    type: number
    sql: nvl(${TABLE}.vfnada_msrp,0) ;;
  }

  dimension: vfnada_rough {
    type: number
    sql: nvl(${TABLE}.vfnada_rough,0) ;;
  }

  dimension: vfsummary_avgmileage {
    type: number
    sql: nvl(${TABLE}.vfsummary_avgmileage,0) ;;
  }

  dimension: vfunits {
    type: number
    sql: nvl(${TABLE}.vfunits,0) ;;
  }

  dimension: vfvalueguide {
    type: string
    hidden:yes
    sql: nvl(${TABLE}.vfvalueguide,'Unknown') ;;
  }

  dimension: vfvintagemodel {
    type: string
    sql: nvl(${TABLE}.vfvintagemodel,'Unknown') ;;
  }

  measure: count {
    type: count
    drill_fields: [id, rumble_invitem_bookdata_conditions.count, rumble_invitem_bookdata_mileages.count, rumble_invitem_bookdata_summaries.count, rumble_invitem_bookdata_times.count]
  }
}
