require 'test_helper'

class AddContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get add_contents_new_url
    assert_response :success
  end

  test "should get add" do
    get add_contents_add_url
    assert_response :success
  end

  test "should get show" do
    get add_contents_show_url
    assert_response :success
  end

end
