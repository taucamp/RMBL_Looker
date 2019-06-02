view: acct_chart_of_accounts {
  sql_table_name: tomtest.chartofaccounts ;;

  dimension: account_number {
    type: string
    primary_key: yes
    sql: ${TABLE}.accountnumber ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }


#   dimension: length {
#     type: string
#     hidden: yes
#     sql: ${TABLE}.length ;;
#   }
#
#   dimension: location {
#     type: string
#     hidden: yes
#     sql: ${TABLE}.location ;;
#   }

  dimension: major_group {
    type: string
    order_by_field: major_group_rank
    sql: ${TABLE}.majorgroup;;
    drill_fields: [minor_group]
  }

  dimension: major_group_rank {
    type: number
    hidden:  yes
    sql: ${TABLE}.majorgroup_rank ;;
  }

  dimension: major_group_with_rank {
    type: string
    hidden:  yes
    sql: convert(varchar,${major_group_rank})+'-'+${major_group} ;;
  }

  dimension: minor_group {
    type: string
    order_by_field: minor_group_rank
    sql: ${TABLE}.minorgroup;;
    drill_fields:[account_number]
  }

  dimension: minor_group_rank {
    type: number
    hidden:  yes
    sql: ${TABLE}.minorgroup_rank ;;
  }

  dimension: minor_group_with_rank {
    type: string
    hidden:  yes
    sql: convert(varchar,${minor_group_rank})+'-'+${minor_group} ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }

  #   dimension: 1powersports {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."1-powersports" ;;
#   }
#
#   dimension: 2cars {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."2-cars" ;;
#   }
#
#   dimension: 3rvs {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."3-rvs" ;;
#   }
#
#   dimension: 4boats {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."4-boats" ;;
#   }
#
#   dimension: 50acquisition {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."50-acquisition" ;;
#   }
#
#   dimension: 52inventory_control__recon {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."52-inventory control & recon" ;;
#   }
#
#   dimension: 54logistics__transportation {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."54-logistics & transportation" ;;
#   }
#
#   dimension: 56finance {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."56-finance" ;;
#   }
#
#   dimension: 58service {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."58-service" ;;
#   }
#
#   dimension: 5classified {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."5-classified" ;;
#   }
#
#   dimension: 60parts_and_accessories {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."60-parts and accessories" ;;
#   }
#
#   dimension: 62dealer_relations {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."62-dealer relations" ;;
#   }
#
#   dimension: 64customer_support {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."64-customer support" ;;
#   }
#
#   dimension: 66documentation {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."66-documentation" ;;
#   }
#
#   dimension: 68accounting__finance {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."68-accounting & finance" ;;
#   }
#
#   dimension: 6logistics {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."6-logistics" ;;
#   }
#
#   dimension: 70marketing {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."70-marketing" ;;
#   }
#
#   dimension: 72rally {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."72-rally" ;;
#   }
#
#   dimension: 74hr {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."74-hr" ;;
#   }
#
#   dimension: 76it {
#     type: string
#     sql: ${TABLE}."76-it" ;;
#   }
#
#   dimension: 78legal {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."78-legal" ;;
#   }
#
#   dimension: 7financial_services {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."7-financial services" ;;
#   }
#
#   dimension: 90management {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."90-management" ;;
#   }
#
#   dimension: 99misc {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."99-misc" ;;
#   }
#
#   dimension: 9unassigned {
#     type: string
#     hidden: yes
#     sql: ${TABLE}."9-unassigned" ;;
#   }


}
