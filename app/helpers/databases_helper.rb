module DatabasesHelper
  def log_data(database)
    session[:database_id] = database.id
  end

  def remember_d(database)
    database.remember
    cookies.permanent.signed[:database_id] = database.id
    cookies.permanent[:remember_token] = database.remember_token
  end

  def current_database?(database)
    database == current_database
  end

  def current_database
    if (database_id = session[:database_id])
      @current_database ||= Database.find_by(id: database_id)
    elsif (database_id = cookies.signed[:database_id])
      database = Database.find_by(id: database_id)
      if database && database.authenticated?(cookies[:remember_token])
        log_data database
        @current_database = database
      end
    end
  end

  def logged_data?
    !current_database.nil?
  end

  def forget_d(database)
    database.forget
    cookies.delete(:database_id)
    cookies.delete(:remember_token)
  end

  def log_out_data
    forget(current_database)
    session.delete(:database_id)
    @current_database = nil
  end

  def redirect_back_or_d(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location_d
    session[:forwarding_url] = request.original_url if request.get?
  end
end
