connection: "redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
datagroup: buyer_payroll_datagroup {
#   sql_trigger: SELECT DATE_PART('hour', GETDATE()) ;;
  sql_trigger: SELECT max("__updatetime") FROM adv_gl_detail ;;
  max_cache_age: "24 hours"
}

explore: adv_buyer_payroll_pdt {}
