view: cls_overall_condition {
  sql_table_name: public.rumble_clsoverallcondition ;;


# Make sure to us ISACTIVE in teh SQL_ALWAYS_WHERE of any EXPLORE

  dimension: overallconditionid {
    primary_key: yes
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.overallconditionid ;;
  }

    dimension: overall_condition {
    type: string
    sql: ${TABLE}.overallcondition ;;
  }

  dimension: isactive {
    hidden:yes
    type: number
    sql: ${TABLE}.isactive ;;
  }

  dimension: rank {
    hidden:yes
    type: number
    sql: ${TABLE}.rank ;;
  }

  measure: count {
    type: count
    drill_fields: [overall_condition]
  }



# BALANCE OF FIELDS ARE NOT USED

#   dimension: id {
#     hidden:yes
#     type: string
#     sql: ${TABLE}.id ;;
#   }
#
#   dimension: __schemaname {
#     hidden:yes
#     type: string
#     sql: ${TABLE}.__schemaname ;;
#   }
#
#   dimension_group: __senttime {
#     hidden:yes
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.__senttime ;;
#   }
#
#   dimension: __tablename {
#     hidden:yes
#     type: string
#     sql: ${TABLE}.__tablename ;;
#   }
#
#   dimension_group: __updatetime {
#     hidden:yes
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.__updatetime ;;
#   }


}
