# frozen_string_literal: true
require 'test_helper'

class FootTrafficAnalysisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get foot_traffic_analysis_index_url
    assert_response :success
  end

  test "should get run" do
    get foot_traffic_analysis_run_url
    assert_response :success
  end

end
