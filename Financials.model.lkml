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

datagroup: financial_datagroup {
  sql_trigger: select max("__updatetime")from adv_gldetail ;;
  max_cache_age: "24 hours"
}

explore: Advent_GL_detail {
    join: Advent_Chart_of_Accounts {
      sql_on: ${Advent_Chart_of_Accounts.account_number}=${Advent_GL_detail.account} ;;
    }

  join: acct_chart_of_accounts {
    sql_on: ${acct_chart_of_accounts.account_number}=split_part(${Advent_Chart_of_Accounts.account_number},'.',1) ;;
  }

  join: acct_division {
    sql_on: ${acct_division.division_id} = f_sql_adv_acct_to_division(${Advent_Chart_of_Accounts.account_number});;
  }

  join: acct_locations {
    sql_on: ${acct_locations.location_id} = f_sql_adv_acct_to_location(${Advent_Chart_of_Accounts.account_number});;
  }

  join: acct_department {
    sql_on: ${acct_department.department_id} = f_sql_adv_acct_to_department(${Advent_Chart_of_Accounts.account_number});;
  }

  join: adv_users {
    sql_on: ${adv_users.user} = @${Advent_GL_detail.user_who_entered};;
  }

}



explore: Schedules {
  label: "Schedules"
  from: Advent_GL_detail
  join: Advent_Chart_of_Accounts {
    sql_on: ${Advent_Chart_of_Accounts.account_number}=${Schedules.account} ;;
  }

  join: adv_schedule_accts {
    sql_on: ${Schedules.account}=${adv_schedule_accts.account_number} ;;
  }

  join: adv_schedules {
    sql_on: ${adv_schedule_accts.schedulenum}=${adv_schedules.schedulenum} ;;
  }
}




explore: ref_dimdate {
    join: Advent_GL_detail{
     relationship: many_to_one
      sql_on: ${Advent_GL_detail.accounting_date_month}<=${ref_dimdate.date_month} ;;
    }

}
