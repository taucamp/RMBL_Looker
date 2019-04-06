view: cls_item_type {
  sql_table_name: public.rumble_clsitemtype ;;


# Make sure to us ISACTIVE in teh SQL_ALWAYS_WHERE of any EXPLORE

  dimension: itemtypeid {
    primary_key: yes
    hidden:yes
    type: number
    value_format_name: id
    sql: ${TABLE}.itemtypeid ;;
  }

    dimension: itemtype {
    type: string
    label: "Item Type"
    view_label: "Classified Summary Info"
    order_by_field: rank
    sql: ${TABLE}.itemtype ;;
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
    type: count
    drill_fields: [itemtype]
  }


# BALANCE OF FIELDS ARE NOT USED

#   dimension: id {
#     type: string
#     hidden:yes
#     sql: ${TABLE}.id ;;
#   }
#
#   dimension: __schemaname {
#     type: string
#     hidden:yes
#     sql: ${TABLE}.__schemaname ;;
#   }
#
#   dimension_group: __senttime {
#     type: time
#     hidden:yes
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
#     type: string
#     hidden:yes
#     sql: ${TABLE}.__tablename ;;
#   }
#
#   dimension_group: __updatetime {
#     type: time
#     hidden:yes
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
#   dimension: createdby {
#     type: number
#     hidden:yes
#     sql: ${TABLE}.createdby ;;
#   }
#
#   dimension_group: creationdate {
#     type: time
#     hidden:yes
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.creationdate ;;
#   }
#
#
#   dimension: lastupdatedby {
#     type: number
#     hidden:yes
#     sql: ${TABLE}.lastupdatedby ;;
#   }
#
#   dimension_group: lastupdateddate {
#     type: time
#     hidden:yes
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.lastupdateddate ;;
#   }


}
