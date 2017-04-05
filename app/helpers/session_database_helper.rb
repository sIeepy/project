module SessionDatabaseHelper
  def data_in(current_db)
    session[:database_id]= current_db.id
  end

  def current_database
    @current_database ||= Database.find_by(id: session[:database_id])
  end

  def data_in?
    !current_database.nil?
  end

  def data_out
    session.delete(:database_id)
    @current_database = nil
  end


end
