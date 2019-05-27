view: inv_bucket {
  sql_table_name: public.rumble_InvBucket ;;

  dimension: bucket_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.BucketId ;;
  }

  dimension: bucket_code {
    type: string
    hidden: yes
    sql: ${TABLE}.BucketCode ;;
  }

  dimension: bucket_name {
    type: string
    sql: ${TABLE}.BucketName ;;
    order_by_field: rank
  }

  dimension_group: created {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension: created_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CreatedUserId ;;
  }

  dimension: is_active {
    type: string
    hidden: yes
    sql: ${TABLE}.IsActive ;;
  }

  dimension: rank {
    type: number
    hidden: yes
    sql: ${TABLE}.Rank ;;
  }

  dimension_group: updated {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.UpdatedDate ;;
  }

  dimension: updated_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.UpdatedUserId ;;
  }

  measure: count {
    type: count
    drill_fields: [bucket_name]
  }
}
