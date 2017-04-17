class CreateTable < ApplicationController
  def initialize(database, user)
    @database = database
    @user = user
  end

  def new_table
    ConnectDatabase.new(@database, @user).connection
    create_table = "CREATE TABLE awsseale (
                              did     integer,
                              name    varchar(40) UNIQUE);"
    RemoteConnect.connection.execute(create_table)
  end
end
