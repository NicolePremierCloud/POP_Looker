include: "top_events.view.lkml"

view: pop_arbitrary {
  extends: [top_events]

     ## ------------------ USER FILTERS  ------------------ ##

  filter: first_period_filter {
    view_label: "_PoP"
    group_label: "Arbitrary Period Comparisons"
    description: "Choose the first date range to compare against. This must be before the second period"
    type: date
  }

  filter: second_period_filter {
    view_label: "_PoP"
    group_label: "Arbitrary Period Comparisons"
    description: "Choose the second date range to compare to. This must be after the first period"
    type: date
  }

  ## ------------------ HIDDEN HELPER DIMENSIONS  ------------------ ##


  dimension: days_from_start_first {
    view_label: "_PoP"
    hidden: yes
    type: number
    sql: date_diff({% date_start first_period_filter %}, CAST(${date_time} AS TIMESTAMP),DAY) ;;

  }

  dimension: days_from_start_second {
    view_label: "_PoP"
    hidden: yes
    type: number
    sql: date_diff({% date_start second_period_filter %}, CAST(${date_time} AS TIMESTAMP),DAY) ;;
      }

## ------------------ DIMENSIONS TO PLOT ------------------ ##


  dimension: days_from_first_period {
    view_label: "_PoP"
    description: "Select for Grouping (Rows)"
    group_label: "Arbitrary Period Comparisons"
    type: number
    sql:
            CASE
            WHEN ${days_from_start_second} >= 0
            THEN ${days_from_start_second}
            WHEN ${days_from_start_first} >= 0
            THEN ${days_from_start_first}
            END;;
  }



  dimension: period_selected {
    view_label: "_PoP"
    group_label: "Arbitrary Period Comparisons"
    label: "First or second period"
    description: "Select for Comparison (Pivot)"
    type: string
    sql:
            CASE
                WHEN {% condition first_period_filter %} CAST(${date_time} AS TIMESTAMP) {% endcondition %}
                THEN 'First Period'
                WHEN {% condition second_period_filter %} CAST(${date_time} AS TIMESTAMP) {% endcondition %}
                THEN 'Second Period'
                END ;;
  }

  ## Filtered measures

  measure: current_period_sessions {
    view_label: "_PoP"
    type: sum
    sql: ${sessions};;
    filters: [period_selected: "Second Period"]
  }

  measure: previous_period_sessions {
    view_label: "_PoP"
    type: sum
    sql: ${sessions};;
    filters: [period_selected: "First Period"]
  }

  measure: sales_pop_change {
    view_label: "_PoP"
    label: "Total sales period-over-period % change"
    type: number
    sql: (1.0 * ${current_period_sessions} / NULLIF(${previous_period_sessions} ,0)) - 1 ;;
    value_format_name: percent_2
  }

  dimension_group: created {hidden: yes}
  dimension: ytd_only {hidden:yes}
  dimension: mtd_only {hidden:yes}
  dimension: wtd_only {hidden:yes}
}

# ---------- EXPLORE ---------- ##

explore: pop_arbitrary {
  label: "PoP Method 6: Compare two arbitrary date ranges"
  always_filter: {
    filters: [first_period_filter: "NOT NULL", second_period_filter: "NOT NULL", period_selected:"-NULL"]
  }


}
