class CreateDatabase < ApplicationController

  def initialize(database_id, id)
    db_id = Database.find(database_id)
    user_id = User.find(id)
    @owner = db_id.db_owner
    @name ="d#{user_id.id}#{db_id.db_name}".underscore
  end

  def create_db
      check = "SELECT 1 FROM pg_database WHERE datname = '#{@name}'"
      result = ActiveRecord::Base.connection.exec_query(check)
    if result.present?
      return result
    else
      form =  "CREATE DATABASE #{@name} OWNER #{@owner};"
      ActiveRecord::Base.connection.execute(form)
    end
  end

  def show
    show = "SELECT * FROM pg_database WHERE datname LIKE '#{@name}'"
    @show = ActiveRecord::Base.connection.execute(show)
  end

end
