connection: "redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# datagroup: buyer_payroll_datagroup {
#   sql_trigger: SELECT DATE_PART('hour', GETDATE()) ;;

  # sql_trigger: SELECT CASE
  #   WHEN current time is in between time 0600 and 1000 THEN 1
  #   WHEN current time is in between time 1000 and 1400 THEN 2
  #   WHEN current time is in between time 1400 and 1800 THEN 3
  #   ELSE 4
  # END ;;
#   max_cache_age: "4 hours"
# }

explore: adv_buyer_payroll_pdt {}
