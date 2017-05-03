class TablesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.valid?
      ur_id = current_user.id
      db_id = current_database.db_name
      t_n = params[:table][:table_name]
      r_n = params[:table][:row_1]
      d_n = params[:table][:data_1]
      CreateTable.new(db_id, ur_id, t_n, r_n, d_n).new_table
      redirect_to edit_table_show_path(table_name: t_n)
    else
      render new
    end
  end

  def show
    ur_id = current_user.id
    db_id = current_database.db_name
    @database = db_id
    @poka = ShowTables.new(db_id, ur_id).show_tables
  end

  private

  def table_params
    params.require(:table).permit(:table_name, :row_1, :data_1)
  end
end
