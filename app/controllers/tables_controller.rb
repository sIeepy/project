class TablesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.valid?
      t = params[:table]
      t_n = params[:table][:table_name].gsub(/^\d/, 't')
      CreateTable.new(name[1], name[0], t).new_table
      redirect_to edit_table_show_path(table_name: t_n)
    else
      redirect_to new_table_path
    end
  end

  def show
    @database = name[1]
    @poka = ShowTables.new(name[1], name[0]).show_tables
  end

  private

  def table_params
    params.require(:table).permit(:table_name)
  end
end
