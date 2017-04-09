class CreateTable < ApplicationController

  def new_table
    table = "CREATE TABLE lol (
      code        char(5),
      title       varchar(40) NOT NULL,
      did         integer NOT NULL,
      date_prod   date,
      kind        varchar(10),
      len         interval hour to minute
        );"
    ActiveRecord::Base.connection.execute(table)
  end


end
