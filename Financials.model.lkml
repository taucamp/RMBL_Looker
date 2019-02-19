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

explore: Advent_GL_detail {
    join: Advent_Chart_of_Accounts {
      sql_on: ${Advent_Chart_of_Accounts.account_number}=${Advent_GL_detail.account} ;;
    }

  join: chartofaccounts {
    sql_on: ${chartofaccounts.account_number}=split_part(${Advent_Chart_of_Accounts.account_number}) ;;
  }
}
