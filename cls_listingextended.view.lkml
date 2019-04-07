view: cls_listingextended {
  sql_table_name: public.rumble_clslistingextended ;;


#  IDs

  dimension: appraisalrefno {
    type: string
    sql: ${TABLE}.appraisalrefno ;;
  }

  dimension: listingid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listingid ;;
  }

  dimension: overallconditionid {
    type: number
    value_format_name: id
    sql: ${TABLE}.overallconditionid ;;
  }

   dimension: sourcetypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sourcetypeid ;;
  }

  dimension: titlestatusid {
    type: number
    value_format_name: id
    sql: ${TABLE}.titlestatusid ;;
  }

  dimension: transmissiontypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.transmissiontypeid ;;
  }







#   DATES

  dimension_group: analysisdate {
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
    sql: ${TABLE}.analysisdate ;;
  }

  dimension_group: offerexpirydate {
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
    sql: ${TABLE}.offerexpirydate ;;
  }





#  YES NO VALUES
  dimension: hasabs {
    type: yesno
    sql: ${TABLE}.hasabs = 1 ;;
  }

  dimension: hasbeenoperated {
    type: yesno
    sql: ${TABLE}.hasbeenoperated = 1 ;;
  }

  dimension: hasdamage {
    type: yesno
    sql: ${TABLE}.hasdamage = 1  ;;
  }

  dimension: hasoutstandingloan {
    type: yesno
    sql: ${TABLE}.hasoutstandingloan = 1  ;;
  }

  dimension: haswarranty {
    type: yesno
    sql: ${TABLE}.haswarranty = 1  ;;
  }

  dimension: isautorenewal {
    type: yesno
    sql: ${TABLE}.isautorenewal = 1  ;;
  }

  dimension: isflagged {
    type: yesno
    sql: ${TABLE}.isflagged = 1  ;;
  }

  dimension: istrial {
    type: yesno
    sql: ${TABLE}.istrial = 1 ;;
  }

  dimension: manualvinentry {
    type: yesno
    sql: ${TABLE}.manualvinentry = 1;;
  }

  dimension: offeraccepted {
    type: yesno
    sql: ${TABLE}.offeraccepted = 1;;
  }


  dimension: safexchangereserved {
    type: yesno
    sql: ${TABLE}.safexchangereserved = 1 ;;
  }

  dimension: willswap {
    type: yesno
    sql: ${TABLE}.willswap = 1 ;;
  }




#Locations
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: titledinstate {
    type: string
    sql: ${TABLE}.titledinstate ;;
  }





  dimension: damagedescription {
    type: string
    sql: ${TABLE}.damagedescription ;;
  }

  dimension: enginesize {
    type: string
    sql: ${TABLE}.enginesize ;;
  }

  dimension: listingdescription {
    type: string
    sql: ${TABLE}.listingdescription ;;
  }

  dimension: listingoptions {
    type: string
    sql: ${TABLE}.listingoptions ;;
  }





  dimension: loanbank {
    type: string
    sql: ${TABLE}.loanbank ;;
  }




  dimension: loanamount {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.loanamount ;;
  }

   dimension: pricemsrp {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.pricemsrp ;;
  }

  dimension:equity_vs_msrp {
    type: number
    value_format_name: usd_0
    sql: ${pricemsrp} - ${loanamount} ;;
  }

  dimension: has_negative_equity_vs_msrp {
    type: yesno
    sql: ${pricemsrp} - ${loanamount} < 0 ;;
    }


  dimension: pricenada {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.pricenada ;;
  }

  dimension: priceppmv {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.priceppmv ;;
  }

  dimension: priceranking {
    type: number
    sql: ${TABLE}.priceranking ;;
  }




  measure: total_loan_amount {
    type: sum
    value_format_name: usd_0
    sql: ${loanamount} ;;

  }

  measure: total_price_msrp {
    type: sum
    value_format_name: usd_0
    sql: ${pricemsrp} ;;

  }

  measure: total_price_nada {
    type: sum
    value_format_name: usd_0
    sql: ${pricenada} ;;

  }

  measure: total_price_ppmv {
    type: sum
    value_format_name: usd_0
    sql: ${priceppmv} ;;

  }


#   THESE ARE NOT USED
#   dimension: id {
#     primary_key: yes
#     type: string
#     sql: ${TABLE}.id ;;
#   }
#
#   dimension: __schemaname {
#     type: string
#     sql: ${TABLE}.__schemaname ;;
#   }
#
#   dimension_group: __senttime {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.__senttime ;;
#   }
#
#   dimension: __tablename {
#     type: string
#     sql: ${TABLE}.__tablename ;;
#   }
#
#   dimension_group: __updatetime {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.__updatetime ;;
#   }



#   measure: count {
#     type: count
#     drill_fields: [id, __tablename, __schemaname]
#   }

}
