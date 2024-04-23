view: landing_pages {
  sql_table_name: `google_analytics_custom.landing_pages` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: avg_session_duration {
    type: number
    sql: ${TABLE}.avg_session_duration ;;
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
  dimension: goal_completions_all {
    type: number
    sql: ${TABLE}.goal_completions_all ;;
  }
  dimension: goal_conversion_rate_all {
    type: number
    sql: ${TABLE}.goal_conversion_rate_all ;;
  }
  dimension: goal_value_all {
    type: number
    sql: ${TABLE}.goal_value_all ;;
  }
  dimension: landing_page_path {
    type: string
    sql: ${TABLE}.landing_page_path ;;
  }
  dimension: new_users {
    type: number
    sql: ${TABLE}.new_users ;;
  }
  dimension: pageviews_per_session {
    type: number
    sql: ${TABLE}.pageviews_per_session ;;
  }
  dimension: percent_new_sessions {
    type: number
    sql: ${TABLE}.percent_new_sessions ;;
  }
  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }
  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }
  measure: count {
    type: count
  }
}
