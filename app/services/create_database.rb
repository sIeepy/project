class CreateDatabase
  def creation(create_db)
    create_db = "CREATE DATABASE" + :db_name + "OWNER" + :db_owner
    create = ActiveRecord::Base.connection.execute(create_db)
  end
end
