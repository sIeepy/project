class DatabasesController < ApplicationController
    attr_accessor :user
    attr_accessor :database
    include DatabasesHelper
  def new
    @database = Database.new :db_owner => current_user.name
  end

  def create
    @database = Database.new(database_params)
    if @database.save
      redirect_to @database
    else
      render 'new'
    end
  end

  def edit
  end

  def show
      @database = Database.find(params[:id])
      u_id = current_user.id
      lel = Database.find(params[:id])
      CreateDatabase.new(lel, u_id).create_db
  end

  private

  def database_params
    params.require(:database).permit(:db_name, :db_owner)
  end
end
