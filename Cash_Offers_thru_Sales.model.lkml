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


explore: cdk_sales_detail {

}

explore: adv_sales_adds {

}


explore: adv_inventory {
}

explore: adv_salesdetail {
  # access_filter: {
    # field:adv_r_invtdetail.region;
    # user_attribut:regions
  # }
  join: adv_inventory {
    type: left_outer
    relationship: many_to_one
    sql_on: ${adv_salesdetail.stocknumber} = ${adv_inventory.stock_number} ;;
  }
}

explore: apr_appraisal {
  join: apr_appraisal_loan {
    type: left_outer
    relationship: one_to_one
    sql_on: ${apr_appraisal_loan.appraisal_id}=${apr_appraisal.appraisal_id} ;;
  }

  join: apr_appraisal_offer {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_appraisal_offer.appraisal_id}=${apr_appraisal.appraisal_id} ;;
  }

  join: apr_appraisal_offer_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_appraisal_offer_type.appraisal_offer_type_id}=${apr_appraisal_offer_type.appraisal_offer_type_id} ;;
  }

  join: apr_appraisal_offer_values {
    type: left_outer
    relationship: one_to_one
    sql_on: ${apr_appraisal_offer_values.appraisal_id}=${apr_appraisal.appraisal_id} ;;
  }

  join: apr_appraisal_status {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_appraisal_status.appraisal_status_id}=${apr_appraisal.appraisal_status_id} ;;
  }

  join: apr_destination_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_destination_type.destination_type_id}=${apr_appraisal.destination_type_id} ;;
  }

  join: apr_item_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_item_type.item_type_id}=${apr_appraisal.item_type_id};;
  }

  # join: apr_listing_type {
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${apr_listing_type.listing_type_id}=${apr_appraisal.listing_type_id} ;;
  # }

  join: apr_mechanical_condition {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_mechanical_condition.mechanical_condition_id}=${apr_appraisal.mechanical_condition_id} ;;
  }

  join: apr_payment_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_payment_type.payment_type_id}=${apr_appraisal.payment_type_id} ;;
  }

  join: apr_physical_condition {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_physical_condition.physical_condition_id}=${apr_appraisal.physical_condition_id} ;;
  }

  join: apr_source_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_source_type.source_type_id}=${apr_appraisal.source_type_id} ;;
  }

  join: apr_tire_condition {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_tire_condition.tire_condition_id}=${apr_appraisal.tire_condition_id} ;;
  }

  join: org_account{
    type: left_outer
    relationship: many_to_one
    sql_on: ${org_account.account_id}=${apr_appraisal.account_id} ;;
  }

  join: org_user{
    type: left_outer
    relationship: many_to_one
    sql_on: ${org_user.user_id}=${apr_appraisal.user_id} ;;
  }

  join: org_user_appraiser{
    type: left_outer
    relationship: many_to_one
    from: org_user
    sql_on: ${org_user_appraiser.user_id}=${apr_appraisal.appraiser_user_id} ;;
  }

  join: org_user_supervisor{
    type: left_outer
    relationship: many_to_one
    from: org_user
    sql_on: ${org_user_supervisor.user_id}=${apr_appraisal_offer.supervisor_user_id} ;;
  }


}

explore: inv_item {
  join: inv_item_status {
    type: left_outer
    sql_on: ${inv_item_status.item_status_id} = ${inv_item.item_status_id} ;;
  }

  join: inv_bucket {
    type: left_outer
    sql_on: ${inv_bucket.bucket_id} = ${inv_item.bucket_id} ;;
  }

  join: inv_category {
    type: left_outer
    sql_on: ${inv_category.category_id} = ${inv_item.category_id} ;;
  }

  join: inv_crtype {
    type: left_outer
    sql_on: ${inv_crtype.crtype_id} = ${inv_item.crtype_id} ;;
  }

  join: inv_shipping_status {
    type: left_outer
    sql_on: ${inv_shipping_status.shipping_status_id} = ${inv_item.shipping_status_id} ;;
  }

  join: inv_stock_type {
    type: left_outer
    sql_on: ${inv_stock_type.stock_type_id} = ${inv_item.stock_type_id} ;;
  }

  join: org_account {
    type: left_outer
    sql_on: ${org_account.account_id} = ${inv_item.account_id} ;;
  }

  join: org_user{
    type: left_outer
    sql_on: ${org_user.user_id}=${inv_item.created_user_id} ;;
  }

}

explore: inv_listing {
  join: inv_item {
    type: left_outer
    sql_on: ${inv_item.item_id}=${inv_listing.item_id} ;;
  }

  join: inv_listing_status {
    type: left_outer
    sql_on: ${inv_listing_status.listing_status_id}=${inv_listing.listing_status_id} ;;
  }

  join: org_user_created_listing{
    from: org_user
    type: left_outer
    sql_on: ${org_user_created_listing.user_id}=${inv_listing.created_user_id} ;;
  }

  join: org_user_updated_listing {
    from: org_user
    type: left_outer
    sql_on: ${org_user_updated_listing.user_id}=${inv_listing.updated_user_id} ;;
  }
}

explore: org_user {
  join: org_user_type {
    type: left_outer
    sql_on: ${org_user_type.user_type_id}=${org_user.user_type_id} ;;
  }

}
