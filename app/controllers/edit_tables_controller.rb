class EditTablesController < ApplicationController
  def show
    ur_id = current_user.id
    db_id = current_database.db_name
    table = params[:table_name]
    @table = table
    @row = TablesContent.new(db_id, ur_id, table).tables_content
  end

  def edit_t
    ur_id = current_user.id
    db_id = current_database.db_name
    @row = TablesContent.new(db_id, ur_id, @table).tables_content
  end

  def rename_r
  end

  def rename_t
  end


  def delete_t
  end

end
