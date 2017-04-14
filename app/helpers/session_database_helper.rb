module SessionDatabaseHelper
  def data_in(database)
    session[:database_id]= database.id
  end

  def data_remember(database)
    database.data_remember
    cookies.permanent.signed[:database_id] = database.id
    cookies.permanent[:remember_token] = database.remember_token
  end

  def current_database?(database)
    database == current_database
  end

  def current_database
    if (database_id = session[:database_id])
      @current_database ||= Database.find_by(id: session[:database_id])
    elsif (database_id = cookies.signed[:database_id])
      database = Database.find_by(id: database_id)
      if database && database.authenticated?(cookies[:remember_token])
        data_in database
        @current_database = database
      end
    end
  end

  def data_in?
    !current_database.nil?
  end

  def data_forget
    user.data_forget
    cookies.delete(:database_id)
    cookies.delete(:remember_token)
  end

  def data_out
    forget(current_database)
    session.delete(:database_id)
    @current_database = nil
  end

  def data_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
