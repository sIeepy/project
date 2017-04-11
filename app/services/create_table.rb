class CreateTable < ApplicationController

  class ReadDatabaseConnection < ActiveRecord::Base
    def self.abstract_class?
      true
    end
  end

  def new_table
    connection = ReadDatabaseConnection.establish_connection(
      adapter: 'postgresql',
      database: 'd2aaa',
      username: 'abc',
      password: 'password1',
      host: 'localhost',
        ).connection
    create_table = "CREATE TABLE awsseale (
                              did     integer,
                              name    varchar(40) UNIQUE);"
    ReadDatabaseConnection.connection.execute(create_table)
  end


end
