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

explore: amex{
  join: amex_cards{
    type:  left_outer
    relationship: many_to_one
    sql_on: right(${amex.account_number},5)=${amex_cards.cardnumber_last5} ;;
    }
  }

  explore: vw_namely_pay_and_hours {}
