class AddContentsController < ApplicationController
  def new
    ur_id = current_user.id
    db_id = current_database.db_name
    @table = params[:table_name]
    @row = TablesContent.new(db_id, ur_id, @table).tables_content
    @show = ShowContent.new(db_id, ur_id, @table).show_content
    binding.pry
  end

  def add
    ur_id = current_user.id
    db_id = current_database.db_name
    table_name = params[:content][:table_name]
    content = params[:content]
    AddContent.new(db_id, ur_id, content).add
    redirect_to new_content_path(table_name: table_name)
  end

  def show
    ur_id = current_user.id
    db_id = current_database.db_name
    @table = params[:table_name]
    @row = TablesContent.new(db_id, ur_id, @table).tables_content
  end
end
