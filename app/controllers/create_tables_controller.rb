class CreateTablesController < ApplicationController
  def new
    CreateTable.new.new_table
  end
end
