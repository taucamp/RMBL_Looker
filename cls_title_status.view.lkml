view: cls_title_status {
  sql_table_name: public.rumble_clstitlestatus ;;


# Make sure to us ISACTIVE in teh SQL_ALWAYS_WHERE of any EXPLORE

  dimension: titlestatusid {
    primary_key: yes
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.titlestatusid ;;
  }

  dimension: title_status {
    type: string
    sql: ${TABLE}.titlestatus ;;
  }

  dimension: isactive {
    hidden:yes
    type: yesno
    sql: ${TABLE}.isactive ;;
  }

  dimension: isbranded {
    type: yesno
    sql: ${TABLE}.isbranded ;;
  }

  measure: count {
    type: count
    drill_fields: [title_status]
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


}
