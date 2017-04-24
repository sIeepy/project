class TablesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    respond_to do |format|
      if @table.valid?
        ur_id = current_user.id
        db_id = current_database.db_name
        t_n = params[:table][:table_name]
        r_n = params[:table][:row_1]
        d_n = params[:table][:data_1]
        CreateTable.new(db_id, ur_id, t_n, r_n, d_n).new_table
        format.html { redirect_to success_path, notice: 'Feedback' }
      else
        format.html { render :new }
      end
    end
  end

   def success
   end

  private

  def table_params
    params.require(:table).permit(:table_name, :row_1, :data_1)
  end
end
