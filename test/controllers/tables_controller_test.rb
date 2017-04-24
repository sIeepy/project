require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tables_new_url
    assert_response :success
  end

  test "should get create" do
    get tables_create_url
    assert_response :success
  end

  test "should get success" do
    get tables_success_url
    assert_response :success
  end

end
