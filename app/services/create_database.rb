class CreateDatabase
  def creation(create_db)
    create_db = "CREATE DATABASE  #{:db_name} OWNER + #{name}"
    create = ActiveRecord::Base.connection.execute(create_db)
  end

  def name(user_db)
    user_db = "#{current_user.id}#{current_user.name}"
  end
end
