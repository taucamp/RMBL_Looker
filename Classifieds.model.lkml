connection: "redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }


explore: cls_listing {

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
