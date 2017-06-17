class ColumnsController < ApplicationController
  def create
    @column = Column.new(column_params)
    t_n = params[:column][:table_name]
    if @column.valid?
      t = params[:column]
      AddColumn.new(name[1], name[0], t).add_column
    end
    redirect_to edit_table_edit_path(table_name: t_n)
  end

  def delete; end

  private

  def column_params
    params.require(:column).permit(:table_name, :row, :data, :required,
                                   :unique, :primary_key, :size)
  end
end
