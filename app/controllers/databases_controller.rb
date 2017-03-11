class DatabasesController < ApplicationController
  def new
    @database= User.database.new
  end

  def edit
  end
end
