class SessionDatabaseController < ApplicationController
  include SessionDatabaseHelper
  skip_before_action :verify_authenticity_token
  def show
    @bases = Database.where(["db_owner = :db_owner",
                          { :db_owner => current_user.name }]).all

  end

  def table
    CreateTable.new.new_table
  end

  def new

  end

  def create
    current_db = Database.find_by(db_name: params[:name])
    user_db = Database.where(["db_owner = :db_owner",
                          { :db_owner => current_user.name }]).all
    if user_db && current_db
      DatabaseConnect.new(current_db).call
      data_in current_db
      redirect_to database_url(id: current_db.id)
    else
      render 'new'
    end
  end

  def delete
    data_out if data_in?
    redirect_to root_url
  end

end
