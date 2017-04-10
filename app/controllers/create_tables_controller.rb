class CreateTablesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def table
    CreateTable.new.new_table
    redirect_to database_url(id: current_database.id)
  end

end
