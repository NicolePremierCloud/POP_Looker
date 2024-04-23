connection: "ga-fivetran-data"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: pop_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pop_test_default_datagroup

explore: content_drilldown {}

explore: all_pages {}

explore: top_events {}

explore: landing_pages {}

explore: exit_pages {}
