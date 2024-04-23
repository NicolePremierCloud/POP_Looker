view: content_drilldown {
  sql_table_name: `google_analytics_custom.content_drilldown` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: avg_time_on_page {
    type: number
    sql: ${TABLE}.avg_time_on_page ;;
  }
  dimension: bounce_rate {
    type: number
    sql: ${TABLE}.bounce_rate ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: exit_rate {
    type: number
    sql: ${TABLE}.exit_rate ;;
  }
  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }
  dimension: page_path_level_1 {
    type: string
    sql: ${TABLE}.page_path_level_1 ;;
  }
  dimension: page_path_level_2 {
    type: string
    sql: ${TABLE}.page_path_level_2 ;;
  }
  dimension: page_path_level_3 {
    type: string
    sql: ${TABLE}.page_path_level_3 ;;
  }
  dimension: page_path_level_4 {
    type: string
    sql: ${TABLE}.page_path_level_4 ;;
  }
  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }
  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }
  dimension: unique_pageviews {
    type: number
    sql: ${TABLE}.unique_pageviews ;;
  }
  measure: count {
    type: count
  }
}
