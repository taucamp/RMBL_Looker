connection: "redshift"

include: "*.view"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: amex_transactions {
  group_label: "Spending"
  join: amex_cards {
    relationship: many_to_one
    sql_on: ${amex_transactions.cardnumber_last5} = ${amex_cards.cardnumber_last5} ;;
  }
}


explore: Payroll {
  group_label: "HR Item"
}


explore:employee_walk {
  group_label: "HR Item"
}



explore: cls_listing {
  group_label: "Classifieds"

  join: cls_listingextended {
    relationship: many_to_one
    sql_on: ${cls_listing.listingid} = ${cls_listingextended.listingid} ;;
  }

  join: cls_category {
    relationship: many_to_one
    sql_on: ${cls_listing.categoryid} = ${cls_category.categoryid} ;;
  }

  join: cls_color {
      relationship: many_to_one
      sql_on: ${cls_listing.primarycolorid} = ${cls_color.colorid};;
  }

#   join: cls_color2{
#     relationship: many_to_one
#     sql_on: ${cls_listing.primarycolorid} = ${cls_color.colorid};;
#   }

  join: cls_itemtype {
    relationship: many_to_one
    sql_on: ${cls_listing.itemtypeid} = ${cls_itemtype.itemtypeid};;
  }

  join: cls_listingstatus {
    relationship: many_to_one
    sql_on: ${cls_listing.listingstatusid} = ${cls_listingstatus.id};;
  }

  join: cls_overallcondition {
    relationship: many_to_one
    sql_on: ${cls_listingextended.overallconditionid} = ${cls_overallcondition.overallconditionid};;
  }

  join: cls_titlestatus {
    relationship: many_to_one
    sql_on: ${cls_listingextended.titlestatusid} = ${cls_titlestatus.titlestatusid};;
  }

  join: cls_transmissiontype {
    relationship: many_to_one
    sql_on: ${cls_listingextended.transmissiontypeid} = ${cls_transmissiontype.transmissiontypeid}.id};;
  }
}
