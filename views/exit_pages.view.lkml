view: exit_pages {
  sql_table_name: `google_analytics_custom.exit_pages` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
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
  dimension: exits {
    type: number
    sql: ${TABLE}.exits ;;
  }
  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }
  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }
  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }
  measure: count {
    type: count
  }
}
