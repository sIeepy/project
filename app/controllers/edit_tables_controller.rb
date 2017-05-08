class EditTablesController < ApplicationController
  def show
    ur_id = current_user.id
    db_id = current_database.db_name
    @table = params[:table_name]
    @row = TablesContent.new(db_id, ur_id, @table).tables_content
  end

  def edit
    @table = params[:table_name]
    ur_id = current_user.id
    db_id = current_database.db_name
    @row = TablesContent.new(db_id, ur_id, @table).tables_content
  end

  def rename_r
  end

  def rename_t
  end


  def delete
    @table = params[:table_name]
    ur_id = current_user.id
    db_id = current_database.db_name
    DeleteTable.new(db_id, ur_id, @table).delete_table
    redirect_to show_table_path
  end

end
