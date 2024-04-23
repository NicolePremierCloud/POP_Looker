view: top_events {
  sql_table_name: `google_analytics_custom.top_events` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: avg_event_value {
    type: number
    sql: ${TABLE}.avg_event_value ;;
  }
  dimension: avg_session_duration {
    type: number
    sql: ${TABLE}.avg_session_duration ;;
  }
  dimension_group: date {
    type: time
    view_label: "_PoP"
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.date ;;
  }
  dimension: event_action {
    type: string
    sql: ${TABLE}.event_action ;;
  }
  dimension: event_category {
    type: string
    sql: ${TABLE}.event_category ;;
  }
  dimension: event_label {
    type: string
    sql: ${TABLE}.event_label ;;
  }
  dimension: event_value {
    type: number
    sql: ${TABLE}.event_value ;;
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
  dimension: total_events {
    type: number
    sql: ${TABLE}.total_events ;;
  }
  dimension: unique_events {
    type: number
    sql: ${TABLE}.unique_events ;;
  }

  #Added Measures
  measure: count {
    label: "Count of top_events"
    type: count
    hidden: yes
  }
  measure: count_events{
    label: "Count of events"
    type: count_distinct
    sql: ${unique_events} ;;
    hidden: yes
  }

  measure: total_session {
    label: "Total Sessions"
    view_label: "_PoP"
    type: sum
    sql: ${sessions} ;;
    drill_fields: [date_time]
  }



}
