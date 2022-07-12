require 'test_helper'

class ZombiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get zombies_show_url
    assert_response :success
  end

  test "should get index" do
    get zombies_index_url
    assert_response :success
  end

end
