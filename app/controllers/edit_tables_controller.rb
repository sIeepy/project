class EditTablesController < ApplicationController
  def show
    ur_id = current_user.id
    db_id = current_database.db_name
    table = params[:table_name]
    @table = table
    @row = TablesContent.new(db_id, ur_id, table).tables_content
  end

  def edit
  end
end
