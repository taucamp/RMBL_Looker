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
    sql: ${TABLE}.vfavgscore ;;
  }

  dimension: vf_avg_score_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfavgscore,1,0) ;;
  }

    dimension: vf_avg_value {
    type: number
    sql: ${TABLE}.vfavgvalue ;;
  }

  dimension: vf_avg_value_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfavgvalue,1,0) ;;
  }

  dimension: vfbb_avg_retail {
    type: number
    sql: ${TABLE}.vfbb_avgretail ;;
  }

  dimension: vfbb_avgretail_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_avgretail,1,0) ;;
  }

  dimension: vfbb_avg_wholesale {
    type: number
    sql: ${TABLE}.vfbb_avgwholesale ;;
  }

  dimension: vfbb_avg_wholesale_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_avgwholesale,1,0) ;;
  }

  dimension: vfbb_clean_wholesale {
    type: number
    sql: ${TABLE}.vfbb_cleanwholesale ;;
  }

  dimension: vfbb_clean_wholesale_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_cleanwholesale,1,0) ;;
  }

  dimension: vfbb_equipped_retail {
    type: number
    sql: ${TABLE}.vfbb_equippedretail ;;
  }

  dimension: vfbb_equipped_retail_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_equippedretail,1,0) ;;
  }

  dimension: vfbb_msrp {
    type: number
    sql: ${TABLE}.vfbb_msrp ;;
  }

  dimension: vfbb_msrp_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_msrp,1,0) ;;
  }

  dimension: vfbb_roughwholesale {
    type: number
    sql: ${TABLE}.vfbb_roughwholesale ;;
  }

  dimension: vfbb_roughwholesale_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_roughwholesale,1,0) ;;
  }

  dimension: vfbb_trade_in_clean {
    type: number
    sql: ${TABLE}.vfbb_tradeinclean ;;
  }

  dimension: vfbb_trade_in_clean_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_tradeinclean,1,0) ;;
  }

  dimension: vfbb_trade_in_fair {
    type: number
    sql: ${TABLE}.vfbb_tradeinfair ;;
  }

  dimension: vfbb_trade_in_fair_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfbb_tradeinfair,1,0) ;;
  }

  dimension: vfkbb_list_price {
    type: number
    sql: ${TABLE}.vfkbb_listprice ;;
  }

  dimension: vfkbb_list_price_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfkbb_listprice,1,0) ;;
  }

  dimension: vfkbb_suggested_retail {
    type: number
    sql: ${TABLE}.vfkbb_suggestedretail ;;
  }

  dimension: vfkbb_suggested_retail_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfkbb_suggestedretail,1,0) ;;
  }

  dimension: vfkbb_wholesale_avg {
    type: number
    sql: ${TABLE}.vfkbb_wholesaleavg ;;
  }

  dimension: vfkbb_wholesale_avg_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfkbb_wholesaleavg,1,0) ;;
  }

  dimension: vfmanheim_retail_above {
    type: number
    sql: ${TABLE}.vfmanheim_retail_above ;;
  }

  dimension: vfmanheim_retail_above_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_retail_above,1,0) ;;
  }

  dimension: vfmanheim_retail_average {
    type: number
    sql: ${TABLE}.vfmanheim_retail_average ;;
  }

  dimension: vfmanheim_retail_average_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_retail_average,1,0) ;;
  }

  dimension: vfmanheim_retail_below {
    type: number
    sql: ${TABLE}.vfmanheim_retail_below ;;
  }

  dimension: vfmanheim_retail_below_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_retail_below,1,0) ;;
  }

  dimension: vfmanheim_wholesale_above {
    type: number
    sql: ${TABLE}.vfmanheim_wholesale_above ;;
  }

  dimension: vfmanheim_wholesale_above_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_wholesale_above,1,0) ;;
  }

  dimension: vfmanheim_wholesale_average {
    type: number
    sql: ${TABLE}.vfmanheim_wholesale_average ;;
  }

  dimension: vfmanheim_wholesale_average_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_wholesale_average,1,0) ;;
  }

  dimension: vfmanheim_wholesale_below {
    type: number
    sql: ${TABLE}.vfmanheim_wholesale_below ;;
  }

  dimension: vfmanheim_wholesale_below_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfmanheim_wholesale_below,1,0) ;;
  }

  dimension: vfnada_avg_retail {
    type: number
    sql: ${TABLE}.vfnada_avgretail ;;
  }

  dimension: vfnada_avg_is_not_null {
    type: yesno
    sql: nvl2(${TABLE}.vfnada_avgretail,1,0) ;;
  }

  dimension: vfnada_categorytype {
    type: string
    sql: ${TABLE}.vfnada_categorytype ;;
  }

  dimension: vfnada_clean {
    type: number
    sql: ${TABLE}.vfnada_clean ;;
  }

  dimension: vfnada_cleanretail {
    type: number
    sql: ${TABLE}.vfnada_cleanretail ;;
  }

  dimension: vfnada_estinvoice {
    type: number
    sql: ${TABLE}.vfnada_estinvoice ;;
  }

  dimension: vfnada_msrp {
    type: number
    sql: ${TABLE}.vfnada_msrp ;;
  }

  dimension: vfnada_rough {
    type: number
    sql: ${TABLE}.vfnada_rough ;;
  }

  dimension: vfsummary_avgmileage {
    type: number
    sql: ${TABLE}.vfsummary_avgmileage ;;
  }

  dimension: vfunits {
    type: number
    sql: ${TABLE}.vfunits ;;
  }

  dimension: vfvalueguide {
    type: string
    hidden:yes
    sql: ${TABLE}.vfvalueguide ;;
  }

  dimension: vfvintagemodel {
    type: string
    sql: ${TABLE}.vfvintagemodel ;;
  }

  measure: count {
    type: count
    drill_fields: [id, rumble_invitem_bookdata_conditions.count, rumble_invitem_bookdata_mileages.count, rumble_invitem_bookdata_summaries.count, rumble_invitem_bookdata_times.count]
  }
}
