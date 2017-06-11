module ApplicationHelper
  def name
    user_id = current_user.id
    database_name = current_database.db_name
    database_owner = current_database.db_owner
    return user_id, database_name, database_owner
  end
end
