connection: "redshift"

include: "*.view"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

case_sensitive: no
week_start_day: sunday

# FINANCIAL RELATED EXPLORES

datagroup: financial_datagroup {
#   sql_trigger: SELECT DATE_PART('hour', GETDATE()) ;;
sql_trigger: SELECT max("__updatetime") FROM adv_gl_detail ;;
max_cache_age: "24 hours"
}


explore: Advent_GL_detail {
  group_label: "Financials / Accounting"
  label: "General Ledger Detail"
  description: "All General Ledger entries and the associated detail, including Division, Deparment, who entered, etc"
  case_sensitive: no

  join: Advent_Chart_of_Accounts {
    sql_on: ${Advent_Chart_of_Accounts.account_number}=${Advent_GL_detail.account} ;;

  }

  join: acct_chart_of_accounts {
    sql_on: ${acct_chart_of_accounts.account_number}=split_part(${Advent_Chart_of_Accounts.account_number},'.',1) ;;
    required_joins: [Advent_Chart_of_Accounts]
  }

  join: acct_division {
    sql_on: ${acct_division.division_id} = ${Advent_GL_detail.gl_account_division_id};;
    required_joins: [Advent_Chart_of_Accounts]
    relationship: many_to_one
  }

  join: acct_locations {
    sql_on: ${acct_locations.location_id} = ${Advent_GL_detail.gl_account_location_id};;
    required_joins: [Advent_Chart_of_Accounts]
    relationship: many_to_one
  }

  join: acct_department {
    sql_on: ${acct_department.department_id} = ${Advent_GL_detail.gl_account_department_id};;
    required_joins: [Advent_Chart_of_Accounts]
    relationship: many_to_one
  }

  join: adv_users {
    sql_on: ${adv_users.user} = ${Advent_GL_detail.user_who_entered};;
  }
}


explore: Schedules {
  group_label: "Financials / Accounting"
  label: "Schedules"
  description: "All General Ledger entries and the associated detail, including Division, Deparment, who entered, etc"
  case_sensitive: no

  from: Advent_GL_detail
  join: Advent_Chart_of_Accounts {
    sql_on: ${Advent_Chart_of_Accounts.account_number}=${Schedules.account} ;;
  }

  join: adv_gl_schedule_accts {
    sql_on: ${Schedules.account}=${adv_gl_schedule_accts.account_number} ;;
  }

  join: adv_gl_schedules {
    sql_on: ${adv_gl_schedule_accts.schedulenum}=${adv_gl_schedules.schedulenum} ;;
  }
}


explore: Financials {
  group_label: "Financials / Accounting"
  label: "Monthly Financials"
  description: "Monthly summary amounts per GL Account"
  case_sensitive: no
  from: adv_gl_financial_summary_pdt
}

explore: Financials_LTD {
  group_label: "Financials / Accounting"
  label: "YTD Financials"
  description: "YTD summary amounts per GL Account"
  case_sensitive: no
  from: adv_gl_financials_pdt
}


explore: ref_dimdate {
  join: Advent_GL_detail {
    type: inner
    relationship: one_to_many
    sql_on: ${Advent_GL_detail.accounting_date_month}<=${ref_dimdate.date_month} ;;

  }
}




# INVENTORY RELATED EXPLORES

explore: Inventory {
  from: adv_inventory






  join: inv_item {
    type: left_outer
    relationship: many_to_one
    sql_on: ${Inventory.stock_number} = ${inv_item.advent_stock_number} and ${Inventory.vin} = ${inv_item.vin} and ${inv_item.is_active} = 1;;
  }

  join: apr_item_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inv_item.item_type_id} = ${apr_item_type.item_type_id} and ${apr_item_type.is_active} = 1;;
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


# VEHICLES SALES RELATED EXPLORES




# APPRAISAL RELATED EXPLORES




# MARKETING RELATED EXPLORES



# AMEX RELATED EXPLORES
explore: amex_transactions {
  group_label: "Spending"
  description: "Shows detail of the RumbleOn spending via AMEX cards for all cardholders and all entities"
  case_sensitive: no
  join: amex_cards {
    relationship: many_to_one
    sql_on: ${amex_transactions.cardnumber_last5} = ${amex_cards.cardnumber_last5} ;;
  }
}



# HR RELATED EXPLORES
explore: Payroll {
  group_label: "HR/Payroll"
  description: "Looks at detail of all Payroll across all entities"
  case_sensitive: no

}


explore:employee_walk {
   group_label: "HR/Payroll"
  description: "Shows Change in Employee Headcount across all entities"
  case_sensitive: no
}








# CLASSIFIEDS RELATED EXPLORES
explore: cls_listing {
  group_label: "Classifieds"
  label: "Classifieds"
  description: "All information related to Classified Listings"
  case_sensitive: no

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




# NEW ETNRIES

explore: cdk_sales_detail {}


explore: adv_sales_adds {}


explore: adv_inventory {}


explore: adv_salesdetail {
  join: adv_inventory {
    type: left_outer
    relationship: many_to_one
    sql_on: ${adv_salesdetail.stock_number_id} = ${adv_inventory.stock_number_id} ;;
  }
}



# APPRAISAL DETAIL
# full join against majority of information
explore: apr_appraisal {

  sql_always_where:${apr_appraisal.user_id} is not null
                  AND ${apr_appraisal.appraisal_status_id} <> 1
                  AND ${apr_appraisal.customer_submitted_date} is not null ;;

# Appraisal Offer and Offer Type as well Offer Type Status
  always_join: [apr_appraisal_offer]
  join: apr_appraisal_offer {
    type: left_outer
    relationship: one_to_one
    sql_on: ${apr_appraisal_offer.appraisal_id} = ${apr_appraisal.appraisal_id} and ${apr_appraisal_offer.is_active} = 1 ;;
  }

  join: apr_appraisal_loan {
    type: left_outer
    relationship: one_to_one
    sql_on: ${apr_appraisal_loan.appraisal_id} = ${apr_appraisal.appraisal_id} ;;
  }


  join: apr_appraisal_offer_status {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_appraisal_offer.offer_status_id} = ${apr_appraisal_status.appraisal_status_id} ;;
  }

#FIELD DOES NOT CURRENTLY EXISTIN IN THE WAREHOUSE
#     join: apr_appraisal_offer_type {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${apr_appraisal_offer_type.appraisal_offer_type_id} = ${apr_appraisal_offer.offer_type_id} and ${apr_appraisal_offer_type.is_active} = 1  ;;
#   }

  join: apr_appraisal_offer_values {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_appraisal_offer_values.appraisal_id} = ${apr_appraisal.appraisal_id} ;;
  }

# Appraisal Status
  join: apr_appraisal_status {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_appraisal_status.appraisal_status_id} = ${apr_appraisal.appraisal_status_id} and ${apr_appraisal_status.is_active} = 1;;
  }

#FIELD DOES NOT CURRENTLY EXISTIN IN THE WAREHOUSE
# # Appraisal Destination Type
#   join: apr_destination_type {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${apr_destination_type.destination_type_id} = ${apr_appraisal.destination_type_id} and ${apr_destination_type.is_active} = 1 ;;
#   }

# Source of the Appraisal
  join: apr_source_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_source_type.source_type_id} = ${apr_appraisal.source_type_id}  and ${apr_source_type.is_active} = 1 ;;
  }


# Appraisal Vehicle Information and Attributes
  join: apr_item_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_item_type.item_type_id} = ${apr_appraisal.item_type_id}  and ${apr_item_type.is_active} = 1;;
  }

#   join: apr_listing_type {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${apr_listing_type.listing_type_id}=${apr_appraisal.listing_type_id} and ${apr_listing_type.is_active} = 1 ;;
#   }


  join: apr_mechanical_condition {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_mechanical_condition.mechanical_condition_id} = ${apr_appraisal.mechanical_condition_id}  and ${apr_mechanical_condition.is_active} = 1 ;;
  }

  join: apr_overall_condition {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_overall_condition.overall_condition_id} = ${apr_appraisal.overall_condition_id}  and ${apr_overall_condition.is_active} = 1 ;;
  }


  join: apr_physical_condition {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_physical_condition.physical_condition_id} = ${apr_appraisal.physical_condition_id}   and ${apr_physical_condition.is_active} = 1;;
  }

#FIELD DOES NOT CURRENTLY EXISTIN IN THE WAREHOUSE
#   join: apr_shipping_issue_type {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${apr_shipping_issue_type.shipping_issue_type_id} = ${apr_appraisal.shipping_issue_type_id}   and ${apr_shipping_issue_type.is_active} = 1;;
#   }

  join: apr_tire_condition {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_tire_condition.tire_condition_id} = ${apr_appraisal.tire_condition_id}  and ${apr_tire_condition.is_active} = 1 ;;
  }

#   Deal Specific Information
  join: apr_payment_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_payment_type.payment_type_id} = ${apr_appraisal.payment_type_id} ;;
  }

  join: apr_title_issue_type {
    type: left_outer
    relationship: many_to_one
    sql_on: ${apr_title_issue_type.title_issue_type_id} = ${apr_appraisal.title_issue_type_id}  and ${apr_title_issue_type.is_active} = 1 ;;
  }


# Detail about Account that submitted
  join: org_account{
    type: left_outer
    relationship: many_to_one
    sql_on: ${org_account.account_id} = ${apr_appraisal.account_id} ;;
  }

  join: org_user{
    type: left_outer
    relationship: many_to_one
    sql_on: ${org_user.user_id} = ${apr_appraisal.user_id} ;;
  }

  join: org_user_type{
    type: left_outer
    relationship: many_to_one
    sql_on: ${org_user.user_type_id} = ${org_user_type.user_type_id} and ${org_user_type.is_active} = 1 ;;
  }

# Detail about Appraiser
  join: org_user_appraiser{
    type: left_outer
    relationship: many_to_one
    from: org_user
    sql_on: ${org_user_appraiser.user_id} = ${apr_appraisal.appraiser_user_id} ;;
  }

# Detail about Supervisor
  join: org_user_supervisor{
    type: left_outer
    relationship: many_to_one
    from: org_user
    sql_on: ${org_user_supervisor.user_id} = ${apr_appraisal_offer.supervisor_user_id} ;;
  }
}





# Inventory Information
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
    sql_on: ${org_user.user_id} = ${inv_item.created_user_id} ;;
  }
}




# Website Listings
explore: inv_listing {
  join: inv_item {
    type: left_outer
    sql_on: ${inv_item.item_id} = ${inv_listing.item_id} ;;
  }

  join: inv_listing_status {
    type: left_outer
    sql_on: ${inv_listing_status.listing_status_id} = ${inv_listing.listing_status_id} ;;
  }

  join: org_user_created_listing{
    from: org_user
    type: left_outer
    sql_on: ${org_user_created_listing.user_id} = ${inv_listing.created_user_id} ;;
  }

  join: org_user_updated_listing {
    from: org_user
    type: left_outer
    sql_on: ${org_user_updated_listing.user_id} = ${inv_listing.updated_user_id} ;;
  }
}


explore: org_user {
  join: org_user_type {
    type: left_outer
    sql_on: ${org_user_type.user_type_id} = ${org_user.user_type_id} ;;
  }
}



#Marketing information

explore: mrktg_adwords_ad_performance_reports  {
      join: mrktg_adwords_ads {
        type: left_outer
        sql_on: ${mrktg_adwords_ads.id} = ${mrktg_adwords_ad_performance_reports.ad_id} ;;
        relationship: many_to_one
      }

      join: mrktg_adwords_ad_groups {
        type: left_outer
        sql_on: ${mrktg_adwords_ad_groups.id} = ${mrktg_adwords_ads.ad_group_id} ;;
        required_joins: [mrktg_adwords_ads]
        relationship: many_to_one
      }

      join: mrktg_adwords_campaigns {
        type: left_outer
        sql_on: ${mrktg_adwords_campaigns.id} = ${mrktg_adwords_ad_groups.campaign_id} ;;
        required_joins: [mrktg_adwords_ads,mrktg_adwords_ad_groups]
        relationship: many_to_one
  }
}


explore: mrktg_bing_ads  {

}


explore: mrktg_facebook_ads {

}

explore: nextgear {

}



explore: Marketing_top_level_weekly {
    from: ref_dimdate
    join: mrktg_summary_spend_and_traffic {
      type: inner
      sql_on:${Marketing_top_level_weekly.datekey} = ${mrktg_summary_spend_and_traffic.week_week};;
      relationship: one_to_many
  }
#   =${Marketing_top_level_weekly.date_date}
}

# explore: ref_dimdate {
#   join: Advent_GL_detail {
#     relationship: many_to_one
#     sql_on: ${Advent_GL_detail.accounting_date_month}<=${ref_dimdate.date_month} ;;
#   }
# }
