class CreateDatabase
  attr_accessor :user
  attr_accessor :database

  def initialize(db_owner, db_name)
    @db_owner= db_owner
    @db_name= db_name
  end


  def create_db
      form = "CREATE DATABASE #{@db_name}"
      ActiveRecord::Base.connection.execute(form)
  end
end
