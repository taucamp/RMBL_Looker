view: cls_transmission_type {
  sql_table_name: public.rumble_clstransmissiontype ;;


# Make sure to us ISACTIVE in teh SQL_ALWAYS_WHERE of any EXPLORE


  dimension: transmissiontypeid {
    primary_key: yes
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.transmissiontypeid ;;
  }

  dimension: transmissiontypename {
    type: string
    label: "Transmission Type"
    view_label: "Classified Summary Info"
    order_by_field: transmissiontypeid
    sql: ${TABLE}.transmissiontypename ;;
  }

  dimension: isactive {
    hidden:yes
    type: yesno
    sql: ${TABLE}.isactive = 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [transmissiontypename]
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
#
#   dimension_group: createddate {
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
#     sql: ${TABLE}.createddate ;;
#   }
#
#   dimension: createduserid {
#     hidden:yes
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.createduserid ;;
#   }


}
