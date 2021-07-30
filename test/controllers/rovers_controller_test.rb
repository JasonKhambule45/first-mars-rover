require 'test_helper'

class RoversControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rovers_index_url
    assert_response :success
  end

  test "should get new" do
    get rovers_new_url
    assert_response :success
  end

  test "should get show" do
    get rovers_show_url
    assert_response :success
  end

  test "should get update" do
    get rovers_update_url
    assert_response :success
  end

end
