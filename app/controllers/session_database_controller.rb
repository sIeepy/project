class SessionDatabaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @bases = Database.where(['db_owner = :db_owner', { db_owner: current_user.name }])
  end

  def new; end

  def create
    database = Database.find_by(db_name: params[:db_session][:database])
    if database
      data_in database
      redirect_to database_url(id: database.id)
    else
      render 'new'
    end
  end

  def destroy
    data_out if data_in?
    redirect_to root_url
  end
end
