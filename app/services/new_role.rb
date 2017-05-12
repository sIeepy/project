class NewRole < ApplicationController

  def initialize(user_id)
    ur_id = User.find user_id
    @owner = ur_id.name
  end

  def create_role
    check = "SELECT 1 FROM pg_roles WHERE rolname = '#{@owner}'"
    result = ActiveRecord::Base.connection.exec_query(check)
    if result.present?
      return result
    else
      ActiveRecord::Base.connection.execute("CREATE USER #{@owner} CREATEDB")
    end
  end
end
