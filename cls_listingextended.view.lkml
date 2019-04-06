view: rumble_clslistingextended {
  sql_table_name: public.rumble_clslistingextended ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: __schemaname {
    type: string
    sql: ${TABLE}.__schemaname ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension: __tablename {
    type: string
    sql: ${TABLE}.__tablename ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

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

  dimension: appraisalrefno {
    type: string
    sql: ${TABLE}.appraisalrefno ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: damagedescription {
    type: string
    sql: ${TABLE}.damagedescription ;;
  }

  dimension: enginesize {
    type: string
    sql: ${TABLE}.enginesize ;;
  }

  dimension: hasabs {
    type: number
    sql: ${TABLE}.hasabs ;;
  }

  dimension: hasbeenoperated {
    type: number
    sql: ${TABLE}.hasbeenoperated ;;
  }

  dimension: hasdamage {
    type: number
    sql: ${TABLE}.hasdamage ;;
  }

  dimension: hasoutstandingloan {
    type: number
    sql: ${TABLE}.hasoutstandingloan ;;
  }

  dimension: haswarranty {
    type: number
    sql: ${TABLE}.haswarranty ;;
  }

  dimension: isautorenewal {
    type: number
    sql: ${TABLE}.isautorenewal ;;
  }

  dimension: isflagged {
    type: number
    sql: ${TABLE}.isflagged ;;
  }

  dimension: istrial {
    type: number
    sql: ${TABLE}.istrial ;;
  }

  dimension: listingdescription {
    type: string
    sql: ${TABLE}.listingdescription ;;
  }

  dimension: listingid {
    type: number
    value_format_name: id
    sql: ${TABLE}.listingid ;;
  }

  dimension: listingoptions {
    type: string
    sql: ${TABLE}.listingoptions ;;
  }

  dimension: loanamount {
    type: number
    sql: ${TABLE}.loanamount ;;
  }

  dimension: loanbank {
    type: string
    sql: ${TABLE}.loanbank ;;
  }

  dimension: manualvinentry {
    type: number
    sql: ${TABLE}.manualvinentry ;;
  }

  dimension: offeraccepted {
    type: number
    sql: ${TABLE}.offeraccepted ;;
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

  dimension: overallconditionid {
    type: number
    value_format_name: id
    sql: ${TABLE}.overallconditionid ;;
  }

  dimension: pricemsrp {
    type: number
    sql: ${TABLE}.pricemsrp ;;
  }

  dimension: pricenada {
    type: number
    sql: ${TABLE}.pricenada ;;
  }

  dimension: priceppmv {
    type: number
    sql: ${TABLE}.priceppmv ;;
  }

  dimension: priceranking {
    type: number
    sql: ${TABLE}.priceranking ;;
  }

  dimension: safexchangereserved {
    type: number
    sql: ${TABLE}.safexchangereserved ;;
  }

  dimension: sourcetypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sourcetypeid ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: titledinstate {
    type: string
    sql: ${TABLE}.titledinstate ;;
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

  dimension: willswap {
    type: number
    sql: ${TABLE}.willswap ;;
  }

  measure: count {
    type: count
    drill_fields: [id, __tablename, __schemaname]
  }
}
