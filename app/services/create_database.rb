class CreateDatabase < ApplicationController

  def initialize(database_id)
    db_id = Database.find database_id
    @name = db_id.db_name
    @owner = db_id.db_owner
  end

  def create_db
    form = "CREATE DATABASE #{@name} OWNER #{@owner};"
    ActiveRecord::Base.connection.execute(form)
  end
end
