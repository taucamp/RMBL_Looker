connection: "redshift"

include: "*.view"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: amex_transactions {
   join: amex_cards {
     relationship: many_to_one
     sql_on: ${amex_transactions.cardnumber_last5} = ${amex_cards.cardnumber_last5} ;;
    }
}


explore: Payroll {}


explore:employee_walk {}
