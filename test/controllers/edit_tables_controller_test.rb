require 'test_helper'

class EditTablesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get edit_tables_show_url
    assert_response :success
  end

  test "should get edit" do
    get edit_tables_edit_url
    assert_response :success
  end

end
