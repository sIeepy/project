require 'test_helper'

class DatabasesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get databases_new_url
    assert_response :success
  end

  test "should get edit" do
    get databases_edit_url
    assert_response :success
  end

end
