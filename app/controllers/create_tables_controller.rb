class CreateTablesController < ApplicationController
    skip_before_action :verify_authenticity_token

  def new
    database = current_database.db_name
    user = current_user.id
    CreateTable.new(database, user).new_table
  end
end
