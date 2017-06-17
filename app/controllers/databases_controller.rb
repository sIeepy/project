class DatabasesController < ApplicationController
  def index; end

  def new
    @database = Database.new(db_owner: current_user.name)
  end

  def create
    @database = Database.new(database_params)
    if @database.save
      data_in @database
      CreateDatabase.new(name[1], name[0], name[2]).create_db
      CreateDatabase.new(name[1], name[0], name[2]).create_schema
      redirect_to @database
    else
      flash[:danger] = 'Input database name'
      render 'new'
    end
  end

  def edit; end

  def show
    @database = Database.find(params[:id])
  end

  private

  def database_params
    params.require(:database).permit(:db_name, :db_owner)
  end
end
