connection: "bigquery_publicdata"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

explore: nyc_taxi_trips {
  sql_always_where: ${location_valid}
    AND ${fare}/${trip_distance} BETWEEN 2 AND 10
     ;;
}
