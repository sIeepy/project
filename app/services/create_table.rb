class CreateTable < ApplicationController

  def new_table
    database = current_database
    user = current_user
    ConnectDatabase.new(database, user).connection
    create_table = "CREATE TABLE awsseale (
                              did     integer,
                              name    varchar(40) UNIQUE);"
    RemoteConnect.connection.execute(create_table)
  end


end
