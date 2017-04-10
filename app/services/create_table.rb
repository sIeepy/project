class CreateTable < ApplicationController

  class ReadDatabaseConnection < ActiveRecord::Base
    def self.abstract_class?
      true
    end
  end

  ReadDatabaseConnection.establish_connection(:user_base)
  def new_table
    create_table = "CREATE TABLE ele (
                              did     integer,
                              name    varchar(40) UNIQUE);"
    ActiveRecord::Base.connection.execute(create_table)
  end


end
