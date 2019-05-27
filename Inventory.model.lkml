connection: "redshift"

include: "*.view"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: Inventory {
  from: adv_inventory
  join: inv_item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${Inventory.stock_number} = ${inv_item.advent_stock_number} and ${Inventory.vin} = ${inv_item.vin} and ${inv_item.is_active} = 1;;
  }

  join: inv_item_status {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inv_item.item_status_id} = ${inv_item_status.item_status_id} and ${inv_item_status.is_active} = 1 ;;
  }

  join: inv_shipping_status {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inv_item.shipping_status_id} = ${inv_shipping_status.shipping_status_id} and ${inv_shipping_status.is_active} = 1;;
  }

    join: inv_bucket {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inv_bucket.bucket_id} = ${inv_item.bucket_id} and ${inv_bucket.is_active} = 1 ;;
  }

    join: inv_category {
      type: left_outer
      relationship: many_to_one
      sql_on: ${inv_category.category_id} = ${inv_item.category_id} and ${inv_category.is_active} = 1 ;;
    }

    join: inv_crtype {
      type: left_outer
      relationship: many_to_one
      sql_on: ${inv_crtype.crtype_id} = ${inv_item.crtype_id} and ${inv_crtype.is_active} = 1 ;;
    }

    join: inv_stock_type {
      type: left_outer
      relationship: many_to_one
      sql_on: ${inv_stock_type.stock_type_id} = ${inv_item.stock_type_id} and ${inv_stock_type.is_active} = 1 ;;
    }


    join: org_location {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inv_item.location_id} = ${org_location.location_id} and ${org_location.is_active} = 1;;
  }

  join: org_account {
      type: left_outer
    relationship: many_to_one
    sql_on: ${org_account.account_id} = ${inv_item.account_id} ;;
    }

    join: org_user{
      type: left_outer
      relationship: many_to_one
      sql_on: ${org_user.user_id} = ${inv_item.created_user_id} ;;
    }
}



explore: Inventory_Advent_Only {
   from: adv_inventory
}


explore: org_account {
  from: adv_inventory
}
