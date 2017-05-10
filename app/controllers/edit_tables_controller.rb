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
    #@size = @row.size
  end

  def update
    @table = params[:table_edit]
    ur_id = current_user.id
    db_id = current_database.db_name
    name = EditTable.new(db_id, ur_id, @table).rename_table
    EditTable.new(db_id, ur_id, @table).rename_row
    redirect_to edit_table_show_path(table_name: name)
  end

  def delete
    @table = params[:table_name]
    ur_id = current_user.id
    db_id = current_database.db_name
    DeleteTable.new(db_id, ur_id, @table).delete_table
    redirect_to show_table_path
  end
end
