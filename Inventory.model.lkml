connection: "redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# Select the views that should be a part of this model,
# and define the joins that connect them together.

explore: Inventory {
  from: adv_inventory
  join: inv_item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${Inventory.stock_number} = ${inv_item.advent_stock_number} and ${inv_item.is_active} = 1;;
  }

  join: inv_item_status {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inv_item.item_status_id} = ${inv_item_status.item_status_id} ;;
  }

  join: inv_shipping_status {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inv_item.shipping_status_id} = ${inv_shipping_status.shipping_status_id};;
  }

  join: org_location {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inv_item.location_id} = ${org_location.location_id};;
  }

}


explore: Inventory_Advent_Only {
   from: adv_inventory
}
