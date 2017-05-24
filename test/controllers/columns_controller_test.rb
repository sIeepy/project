require 'test_helper'

class ColumnsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get columns_new_url
    assert_response :success
  end

  test "should get create" do
    get columns_create_url
    assert_response :success
  end

  test "should get delete" do
    get columns_delete_url
    assert_response :success
  end

end
