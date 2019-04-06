view: cls_category {
  sql_table_name: public.rumble_clscategory ;;



# Make sure to us ISACTIVE in teh SQL_ALWAYS_WHERE of any EXPLORE

  dimension: categoryid {
    hidden:yes
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.categoryid ;;
  }

  dimension: category {
    type: string
    label: "Vehicle Category"
    view_label: "Classified Summary Info"
    order_by_field: rank
    sql: ${TABLE}.category ;;
  }

  dimension: isactive {
    hidden:yes
    type: yesno
    sql: ${TABLE}.isactive = 1 ;;
  }

  dimension: rank {
    hidden:yes
    type: number
    sql: ${TABLE}.rank ;;
  }

  measure: count {
    hidden:yes
    type: count
    drill_fields: [category]
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
