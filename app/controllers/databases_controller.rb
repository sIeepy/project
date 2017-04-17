class DatabasesController < ApplicationController

  def new
    @database = Database.new :db_owner => current_user.name
  end

  def create
    @database = Database.new(database_params)
    if @database.save
      data_in @database
      ur_id = current_user.id
      db_id = current_database.id
      CreateDatabase.new(db_id, ur_id).create_db
      redirect_to @database
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @database = Database.find(params[:id])
  end

  private

  def database_params
    params.require(:database).permit(:db_name, :db_owner)
  end
end
