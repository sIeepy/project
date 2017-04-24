class TablesController < ApplicationController
    skip_before_action :verify_authenticity_token
  def new
      @table = Table.new
  end

  def create
    @table = Table.new(table_params)
      respond_to do |format|
      if @table.valid?
          format.html { redirect_to success_path, notice: 'bla.' }
      else
          format.html { render :new }
      end
      end
  end

   def success
   end

  private

   def table_params
    params.require(:table).permit(:name, :email)
   end
end
