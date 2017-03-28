class CreateDatabase < ApplicationController

  def initialize(database_id, id)
    db_id = Database.find database_id
    user_id = User.find id
    @owner = db_id.db_owner
    @u_name ="d#{user_id.id}#{db_id.db_name}".underscore
  end

  def create_db
      check = "SELECT 1 FROM pg_database WHERE datname = '#{@u_name}'"
      result = ActiveRecord::Base.connection.exec_query(check)
    if result.present?
            return result
    else
      form =  "CREATE DATABASE #{@u_name} OWNER #{@owner};"
      ActiveRecord::Base.connection.execute(form)
    end
  end
end
