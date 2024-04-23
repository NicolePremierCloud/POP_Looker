view: all_pages {
  sql_table_name: `google_analytics_custom.all_pages` ;;

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
  dimension: entrance_rate {
    type: number
    sql: ${TABLE}.entrance_rate ;;
  }
  dimension: entrances {
    type: number
    sql: ${TABLE}.entrances ;;
  }
  dimension: exit_rate {
    type: number
    sql: ${TABLE}.exit_rate ;;
  }
  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }
  dimension: page_value {
    type: number
    sql: ${TABLE}.page_value ;;
  }
  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }
  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }
  dimension: unique_pageviews {
    type: number
    sql: ${TABLE}.unique_pageviews ;;
  }
  measure: count {
    type: count
  }
}
