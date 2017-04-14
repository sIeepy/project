require 'test_helper'

class CreateTablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get create_tables_new_url
    assert_response :success
  end

end
