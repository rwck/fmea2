require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    @issue = issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
      post :create, issue: { cause_of_failure: @issue.cause_of_failure, current_controls: @issue.current_controls, detection_dormancy_period: @issue.detection_dormancy_period, detection_indicators: @issue.detection_indicators, effect_of_failure: @issue.effect_of_failure, failure: @issue.failure, function: @issue.function, further_investigation: @issue.further_investigation, item: @issue.item, probability_estimate: @issue.probability_estimate, recommended_actions: @issue.recommended_actions, risk_level: @issue.risk_level, severity_estimate: @issue.severity_estimate }
    end

    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should show issue" do
    get :show, id: @issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue
    assert_response :success
  end

  test "should update issue" do
    patch :update, id: @issue, issue: { cause_of_failure: @issue.cause_of_failure, current_controls: @issue.current_controls, detection_dormancy_period: @issue.detection_dormancy_period, detection_indicators: @issue.detection_indicators, effect_of_failure: @issue.effect_of_failure, failure: @issue.failure, function: @issue.function, further_investigation: @issue.further_investigation, item: @issue.item, probability_estimate: @issue.probability_estimate, recommended_actions: @issue.recommended_actions, risk_level: @issue.risk_level, severity_estimate: @issue.severity_estimate }
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete :destroy, id: @issue
    end

    assert_redirected_to issues_path
  end
end
