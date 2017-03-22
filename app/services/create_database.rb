class CreateDatabase < ApplicationController
    def initialize(database_id)
      db_id = Database.find database_id
      @name = db_id.db_name
    end

  def create_db
    form = "CREATE DATABASE #{:name}"
    ActiveRecord::Base.connection.execute(form)
  end
end
