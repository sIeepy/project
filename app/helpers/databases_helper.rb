module DatabasesHelper
#  def user_id
#    if (user_id = session[:user_id])
#      @current_user ||= User.find_by(id: user_id)
#    end
#  end
#
#  def database_name
#    @database = Database.find_by(db_name: :current_database)
#  end
#end
#@bases = Database.where(["db_owner = :db_owner",
#                      { :db_owner => current_user.name }]).all
