require 'test_helper'

class DiagnoseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get diagnose_new_url
    assert_response :success
  end

  test "should get show" do
    get diagnose_show_url
    assert_response :success
  end

end
