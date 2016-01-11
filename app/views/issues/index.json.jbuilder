json.array!(@issues) do |issue|
  json.extract! issue, :id, :item, :function, :failure, :effect_of_failure, :cause_of_failure, :current_controls, :recommended_actions, :probability_estimate, :severity_estimate, :detection_indicators, :detection_dormancy_period, :risk_level, :further_investigation
  json.url issue_url(issue, format: :json)
end
