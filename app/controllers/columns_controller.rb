class ColumnsController < ApplicationController

  def create
      @column = Column.new(column_params)
      t_n = params[:column][:table_name]
      if @column.valid?
        ur_id = current_user.id
        db_id = current_database.db_name
        t = params[:column]
        AddColumn.new(db_id, ur_id, t).add_column
        redirect_to edit_table_edit_path(table_name: t_n)
      else
        redirect_to edit_table_edit_path(table_name: t_n)
      end
  end

  def delete
  end
  private

  def column_params
    params.require(:column).permit(:table_name, :row, :data, :required, :unique, :primary_key, :size)
  end
end
