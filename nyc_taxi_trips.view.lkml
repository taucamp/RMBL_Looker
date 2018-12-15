view: nyc_taxi_trips {
  sql_table_name: [nyc-tlc:yellow.trips] ;;
  #   sql_table_name: "[nyc-tlc:yellow.trips],[nyc-tlc:green.trips_2015]"

  dimension_group: pickup {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      week_of_year,
      hour_of_day,
      day_of_week,
      minute5,
      minute10,
      time_of_day
    ]
    sql: ${TABLE}.pickup_datetime ;;
  }

  dimension_group: dropoff {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      week_of_year,
      hour_of_day,
      day_of_week,
      minute5,
      minute10,
      time_of_day
    ]
    sql: ${TABLE}.dropoff_datetime ;;
  }

  dimension: pickup_minute10_of_day {
    sql: SUBSTR(TIME(${pickup_minute10}), 0, 5) ;;
    alias: [trips.colin]
  }

  dimension: dropoff_minute10_of_day {
    sql: SUBSTR(TIME(${pickup_minute10}), 0, 5) ;;
  }

  dimension: likely_destination {
    type: string

    case: {
      when: {
        sql: ${TABLE}.dropoff_latitude >= 40.76 AND
          ${TABLE}.dropoff_latitude <= 40.78 AND
          ${TABLE}.dropoff_longitude >= -73.88 AND
          ${TABLE}.dropoff_longitude <= -73.85
           ;;
        label: "LaGuardia"
      }

      when: {
        sql: ${TABLE}.dropoff_latitude >= 40.68 AND
          ${TABLE}.dropoff_latitude <= 40.71 AND
          ${TABLE}.dropoff_longitude >= -74.18 AND
          ${TABLE}.dropoff_longitude <= -74.16
           ;;
        label: "Newark"
      }

      when: {
        sql: ${TABLE}.dropoff_latitude >= 40.64 AND
          ${TABLE}.dropoff_latitude <= 40.65 AND
          ${TABLE}.dropoff_longitude >= -73.80 AND
          ${TABLE}.dropoff_longitude <= -73.78
           ;;
        label: "JFK"
      }

      when: {
        sql: true ;;
        label: "Other"
      }
    }
  }

  dimension: likely_origin {
    type: string

    case: {
      when: {
        sql: ${TABLE}.pickup_latitude >= 40.76 AND
          ${TABLE}.pickup_latitude <= 40.78 AND
          ${TABLE}.pickup_longitude >= -73.88 AND
          ${TABLE}.pickup_longitude <= -73.85
           ;;
        label: "LaGuardia"
      }

      when: {
        sql: ${TABLE}.pickup_latitude >= 40.68 AND
          ${TABLE}.pickup_latitude <= 40.71 AND
          ${TABLE}.pickup_longitude >= -74.18 AND
          ${TABLE}.pickup_longitude <= -74.16
           ;;
        label: "Newark"
      }

      when: {
        sql: ${TABLE}.pickup_latitude >= 40.64 AND
          ${TABLE}.pickup_latitude <= 40.65 AND
          ${TABLE}.pickup_longitude >= -73.80 AND
          ${TABLE}.pickup_longitude <= -73.78
           ;;
        label: "JFK"
      }

      when: {
        sql: true ;;
        label: "Other"
      }
    }
  }

  dimension: likely_airport {
    type: yesno
    sql: ${likely_destination} IN ('LaGuardia', 'Newark', 'JFK') OR ${likely_origin} IN ('LaGuardia', 'Newark', 'JFK') ;;
  }

  dimension: store_and_fwd_flag {
    type: string
    sql: ${TABLE}.store_and_fwd_flag ;;
  }

  dimension: rate_code {
    type: number
    sql: ${TABLE}.rate_code ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: pickup_location {
    type: location
    sql_latitude: ${TABLE}.pickup_latitude ;;
    sql_longitude: ${TABLE}.pickup_longitude ;;
  }

  dimension: dropoff_location {
    type: location
    sql_latitude: ${TABLE}.dropoff_latitude ;;
    sql_longitude: ${TABLE}.dropoff_longitude ;;
  }

  dimension: dropoff_latitude_rounded {
    type: number
    sql: round(${TABLE}.dropoff_latitude, 3) ;;
    value_format: "#0.000"
  }

  dimension: dropoff_longitude_rounded {
    type: number
    sql: round(${TABLE}.dropoff_longitude, 3) ;;
    value_format: "#0.000"
  }

  dimension: pickup_location_rounded {
    type: location
    sql_latitude: round(${TABLE}.pickup_latitude, 3) ;;
    sql_longitude: round(${TABLE}.pickup_longitude, 3) ;;
  }

  dimension: dropoff_location_rounded {
    type: location
    sql_latitude: round(${TABLE}.dropoff_latitude, 3) ;;
    sql_longitude: round(${TABLE}.dropoff_longitude, 3) ;;
  }

  dimension: is_pickup_different_from_dropoff {
    type: yesno
    sql: ${pickup_location_rounded}<>${dropoff_location_rounded} ;;
  }

  dimension: location_valid {
    type: yesno
    sql: abs(${TABLE}.pickup_latitude) != 0 AND abs(${TABLE}.dropoff_latitude) != 0 AND ${TABLE}.pickup_longitude != -73.137393 ;;
    hidden: no
  }

  dimension: rounded_location_valid {
    type: yesno
    sql: (round(${TABLE}.pickup_latitude, 3)) > 0.1
      AND
      (round(${TABLE}.pickup_longitude, 3)) > 0.1
      AND
      (round(${TABLE}.dropoff_latitude, 3)) > 0.1
      AND
      (round(${TABLE}.dropoff_longitude, 3)) > 0.1
       ;;
  }

  dimension: number_of_passengers {
    type: number
    sql: ${TABLE}.passenger_count ;;
  }

  dimension: passengers_tiered {
    case: {
      when: {
        sql: ${number_of_passengers} <=1 ;;
        label: "one"
      }

      when: {
        sql: ${number_of_passengers} = 2 ;;
        label: "two"
      }

      when: {
        sql: ${number_of_passengers} >= 3 ;;
        label: "three or more"
      }
    }
  }

  dimension: trip_distance {
    type: number
    sql: ${TABLE}.trip_distance ;;
    value_format: "#0.00"
  }

  dimension: trip_distance_tiers {
    type: tier
    tiers: [
      0,
      1,
      2,
      3,
      5,
      10,
      20,
      30,
      50
    ]
    sql: ${trip_distance} ;;
  }

  dimension: payment_type {
    type: string

    case: {
      when: {
        sql: ${TABLE}.payment_type='CRD' ;;
        label: "Credit card"
      }

      when: {
        sql: ${TABLE}.payment_type='CSH' ;;
        label: "Cash"
      }

      when: {
        sql: ${TABLE}.payment_type='NOC' ;;
        label: "No charge"
      }

      when: {
        sql: ${TABLE}.payment_type='DIS' ;;
        label: "Dispute"
      }

      else: "Unknown"
    }
  }

  dimension: extra {
    type: number
    sql: ${TABLE}.extra ;;
  }

  dimension: mta_tax {
    type: number
    sql: ${TABLE}.mta_tax ;;
  }

  dimension: tip {
    type: number
    sql: ${TABLE}.tip_amount ;;
    value_format: "$#,##0.00"
  }

  dimension: tip_percentage {
    type: number
    sql: (${tip} / ${fare}) * 100 ;;
    value_format: "0.00\"%\""
  }

  dimension: tip_percentage_buckets {
    type: tier
    style: integer
    tiers: [
      0,
      5,
      10,
      15,
      20,
      25,
      30
    ]
    sql: ${tip_percentage} ;;
  }

  dimension: tip_percentage_rounded {
    type: number
    sql: ROUND((${tip} / ${fare}) * 100) ;;
    value_format: "0\"%\""
  }

  dimension: tipped {
    type: yesno
    sql: ${tip} > 0 ;;
  }

  dimension: tolls_amount {
    type: number
    sql: ${TABLE}.tolls_amount ;;
  }

  dimension_group: ehail_fee {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ehail_fee ;;
  }

  dimension: fare {
    type: number
    sql: ${TABLE}.total_amount ;;
    value_format: "$#,##0.00"
  }

  dimension: fare_rounded {
    type: number
    sql: ROUND(${fare}) ;;
    value_format: "$#,##0"
  }

  dimension: trip_time_minutes {
    type: number
    sql: (TIMESTAMP_TO_SEC(${TABLE}.dropoff_datetime)-TIMESTAMP_TO_SEC(${TABLE}.pickup_datetime))/60 ;;
    value_format: "#0.0"
  }

  #   MEASURES

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_distance {
    type: sum
    sql: ${trip_distance} ;;
  }

  measure: average_distance {
    type: average
    sql: ${trip_distance} ;;
    value_format_name: decimal_2
  }

  measure: total_fare {
    type: sum
    sql: ${fare} ;;
    value_format: "$#,##0.00"
  }

  measure: average_fare {
    type: average
    sql: ${fare} ;;
    value_format: "$#,##0.00"
  }

  measure: average_passengers {
    type: average
    sql: ${number_of_passengers} ;;
    value_format: "0.0"
  }

  measure: average_tip {
    type: average
    sql: ${tip} ;;
    value_format: "$#,##0.00"
  }

  measure: total_tip {
    type: sum
    sql: ${tip} ;;
    value_format: "$#,##0.00"
  }

  measure: average_tip_percentage {
    type: average
    sql: ${tip_percentage} ;;
    value_format: "0.00\"%\""
  }

  measure: count_who_tipped {
    type: count

    filters: {
      field: tipped
      value: "Yes"
    }
  }

  measure: count_who_did_not_tip {
    type: count

    filters: {
      field: tipped
      value: "No"
    }
  }

  measure: percent_who_tipped {
    type: number
    sql: (CAST(${count_who_tipped} AS float) / CAST(${count} AS float)) * 100 ;;
    value_format: "0.00\"%\""
  }

  measure: total_trip_time_seconds {
    hidden: yes
    type: sum
    sql: (TIMESTAMP_TO_SEC(${TABLE}.dropoff_datetime)-TIMESTAMP_TO_SEC(${TABLE}.pickup_datetime)) ;;
  }

  measure: average_trip_time_seconds {
    hidden: yes
    type: average
    sql: (TIMESTAMP_TO_SEC(${TABLE}.dropoff_datetime)-TIMESTAMP_TO_SEC(${TABLE}.pickup_datetime)) ;;
  }

  measure: total_trip_time_minutes {
    type: sum
    sql: ${trip_time_minutes} ;;
    value_format: "#0.0"
  }

  measure: average_trip_time_minutes {
    type: average
    sql: ${trip_time_minutes} ;;
    value_format: "#0.0"
    drill_fields: [pickup_date, total_trip_time_minutes]
  }

  measure: average_speed {
    type: number
    sql: ${total_distance}/(${total_trip_time_seconds}/3600) ;;
    value_format: "#0.0\" mph\""
  }

  measure: average_speed_5 {
    hidden: yes
    type: number
    sql: case when ${average_speed}<=5 then ${average_speed} else 0 end ;;
    value_format: "#0.0\" mph\""
    drill_fields: [pickup_hour_of_day, average_speed, average_trip_time_minutes, average_distance]
  }

  measure: average_speed_10 {
    hidden: yes
    type: number
    sql: case when ${average_speed}<=15 and ${average_speed} > 5 then ${average_speed} else 0 end ;;
    value_format: "#0.0\" mph\""
  }

  measure: average_speed_15 {
    hidden: yes
    type: number
    sql: case when ${average_speed}>15 then ${average_speed} else 0 end ;;
    value_format: "#0.0\" mph\""
  }

  set: detail {
    fields: [pickup_location_rounded, count]
  }
}
