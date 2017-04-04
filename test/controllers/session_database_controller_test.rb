require 'test_helper'

class SessionDatabaseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_database_new_url
    assert_response :success
  end

end
