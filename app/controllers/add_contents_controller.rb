class AddContentsController < ApplicationController
  def new
    @table = params[:table_name]
    @row = TablesContent.new(name[1], name[0], @table).tables_content
    @show = ShowContent.new(name[1], name[0], @table).show_content
    @primary = PrimaryKey.new(name[1], name[0], @table).primary_key
  end

  def add
    table_name = params[:content][:table_name]
    content = params[:content]
    AddContent.new(name[1], name[0], content).add
    redirect_to new_content_path(table_name: table_name)
  end

  def show
    @table = params[:table_name]
    @row = TablesContent.new(name[1], name[0], @table).tables_content
    @show = ShowContent.new(name[1], name[0], @table).show_content
    @primary = PrimaryKey.new(name[1], name[0], @table).primary_key
  end
end
