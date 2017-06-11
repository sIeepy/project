class EditTablesController < ApplicationController
  def show
    @table = params[:table_name]
    @row = TablesContent.new(name[1], name[0], @table).tables_content
    @primary = PrimaryKey.new(name[1], name[0], @table).primary_key
  end

  def edit
    @table = params[:table_name]
    @row = TablesContent.new(name[1], name[0], @table).tables_content
    @show = ShowContent.new(name[1], name[0], @table).show_content
    @primary = PrimaryKey.new(name[1], name[0], @table).primary_key
  end

  def update
    @table = params[:table_edit]
    tab_name = EditTable.new(name[1], name[0], @table).rename_table
    EditTable.new(name[1], name[0], @table).rename_row
    EditTable.new(name[1], name[0], @table).drop_col
    redirect_to edit_table_show_path(table_name: tab_name)
  end

  def delete
    @table = params[:table_name]
    DeleteTable.new(name[1], name[0], @table).delete_table
    redirect_to show_table_path
  end
end
